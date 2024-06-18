local M = {}

local ts_utils = require("nvim-treesitter.ts_utils")

-- Function to get the current function declaration
local function get_function_declaration()
	local node = ts_utils.get_node_at_cursor()
	local rootfound = nil
	while node do
		if node:type() == "function_definition" or node:type() == "translation_unit" or node:type() == "ERROR" then
			rootfound = node
			-- vim.print(node:type())
			break
		end
		node = node:parent()
	end
	if rootfound then
		for namedChild in rootfound:iter_children() do
			-- node = rootfound:named_child(1)
			-- vim.print(namedChild:type())
			if namedChild and (namedChild:type() == "function_declarator" or namedChild:type() == "declarator") then
				return namedChild
			end
		end
	end
	return nil
end

-- Function to get the text of a node
local function get_node_text(node)
	local bufnr = vim.api.nvim_get_current_buf()
	local start_row, start_col, end_row, end_col = node:range()
	local lines = vim.api.nvim_buf_get_lines(bufnr, start_row, end_row + 1, false)
	if #lines == 0 then
		return ""
	end
	lines[#lines] = string.sub(lines[#lines], 1, end_col)
	lines[1] = string.sub(lines[1], start_col + 1)
	return table.concat(lines, "\n")
end

-- Function to print information
function M.print_info()
	local bufnr = vim.api.nvim_get_current_buf()
	local file_name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":.")

	local start_pos = vim.fn.getpos("'<")
	local end_pos = vim.fn.getpos("'>")

	local start_line = start_pos[2]
	local end_line = end_pos[2]

	local lines = vim.api.nvim_buf_get_lines(bufnr, start_line - 1, end_line, false)

	local canhtml = false -- vim.fn.exepath("xclip")

	local outcontent = ""
	if file_name then
		outcontent = outcontent .. "File: " .. file_name .. "\n"
	else
		outcontent = outcontent .. "File: None" .. "\n"
	end

	if canhtml then
		outcontent = outcontent .. "<pre>\n"
	end
	local func_decl = get_function_declaration()
	if func_decl then
		outcontent = outcontent .. "Func: " .. get_node_text(func_decl) .. "\n"
	end

	if canhtml then
		outcontent = outcontent .. "<hr>\n"
	end
	for i, line in ipairs(lines) do
		outcontent = outcontent .. string.format("%d: %s", start_line + i - 1, line) .. "\n"
	end

	if canhtml then
		outcontent = outcontent .. "</pre>\n"
	end
	vim.fn.setreg("+", outcontent)

	local tmpfile = os.tmpname()
	local handle = canhtml and io.open(tmpfile, "w") or nil
	if handle then
		handle:write(outcontent)
		handle:close()
		local cmd = "xclip -selection clipboard -l 10 -t text/html  " .. tmpfile
		-- vim.print(cmd)
		os.execute(cmd)
		os.remove(tmpfile)
	else
		vim.fn.setreg("+", outcontent)
	end
end

-- Create a command to call the function
vim.api.nvim_create_user_command("PrintFunctionInfo", function()
	M.print_info()
end, { range = true })

return M
