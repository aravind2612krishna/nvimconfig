-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.autoformat = false
vim.opt.fdo:append("jump") -- open folds on jump
vim.opt.expandtab = true -- expand tabs to spaces
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.complete = { ".", "w" } -- auto complete from current buffer and open windows by default

vim.opt.cindent = true
vim.opt.cino = { "t0", ":0", "(0", "N-s" }

vim.opt.sessionoptions = { "buffers", "curdir", "tabpages" } -- store these in mksession
vim.opt.clipboard = "unnamedplus" -- clipboard to vim yank
vim.opt.shortmess:append("c")
vim.opt.diffopt:append({ "algorithm:patience", "indent-heuristic", "iwhite", "vertical" })

vim.opt.virtualedit:append({ "block", "onemore" }) -- allow moving cursor past end of the line

-- advanced
vim.api.nvim_create_user_command("HtmlClip", function(args)
  local saved_html_use_css = vim.g.html_use_css
  local saved_html_no_progress = vim.g.html_no_progress
  vim.g.html_use_css = false
  vim.g.html_no_progress = true
  vim.cmd({
    cmd = "TOhtml",
    range = { args.line1, args.line2 },
  })
  vim.g.html_use_css = saved_html_use_css
  vim.g.html_no_progress = saved_html_no_progress

  vim.cmd.g("<body")
  vim.cmd("normal oFile : ")
  vim.cmd('normal "#p')
  vim.cmd("normal a<br>")
  vim.cmd("w !xclip -selection clipboard -t text/html -i")
  vim.cmd.bwipeout({ bang = true })
end, {
  range = "%",
})

-- TermDebug
vim.api.nvim_create_user_command("Dbg", function()
  vim.cmd.packadd("termdebug")
  vim.cmd("Termdebug")

  vim.cmd("hi debugPC term=reverse ctermbg=darkgrey guibg=darkblue")
  vim.cmd("hi debugBreakpoint term=reverse ctermbg=blue guibg=red")
  if not vim.g["termdebug_config"] then
    vim.g.termdebug_config = {}
  end
  vim.g.termdebug_config["map_K"] = 0
  vim.g.termdebug_wide = 163

  vim.keymap.set("n", "<leader>gu", function()
    local lno = vim.fn.line(".")
    local dbgcmd = "until " .. lno
    vim.fn.TermDebugSendCommand(dbgcmd)
  end, { desc = "Gdb run until" })
  vim.keymap.set("n", "<leader>jb", function()
    local lno = vim.fn.line(".")
    vim.fn.TermDebugSendCommand("tbreak " .. lno)
    vim.fn.TermDebugSendCommand("jump " .. lno)
  end, { desc = "Gdb jump back" })
  vim.keymap.set("n", "<leader>gc", function()
    vim.cmd("Continue")
  end, { desc = "Continue" })
  vim.keymap.set("n", "<CR>", function()
    vim.cmd("Over")
  end, { desc = "Step over" })
  vim.keymap.set("n", "<leader>gk", function()
    vim.fn.TermDebugSendCommand("up")
  end, { desc = "Up" })
  vim.keymap.set("n", "<leader>gj", function()
    vim.fn.TermDebugSendCommand("down")
  end, { desc = "Down" })
  vim.keymap.set("n", "<leader>]", "<cmd>Step<CR>", { desc = "Step into" })
  vim.keymap.set("n", "<leader>[", function()
    vim.cmd("Finish")
  end, { desc = "Step out of" })
  --"<cmd>call TermDebugSendCommand('p ' . expand("<cword>"))<CR>")
  vim.keymap.set("n", "<leader>k", function()
    local dbgcmd = "p " .. vim.fn.expand("<cexpr>")
    vim.fn.TermDebugSendCommand(dbgcmd)
  end, { desc = "Gdb print under cursor" })
  vim.keymap.set({ "n", "v" }, "\\", function()
    vim.cmd("Evaluate")
  end, { desc = "Evaluate" })
  vim.keymap.set("n", "<leader>ga", function()
    vim.fn.TermDebugSendCommand("pattach hwx")
  end, { desc = "attach to recent hwx" })
end, { desc = "Start termdebug gdb" })

if vim.g.neovide ~= nil then
  vim.g.neovide_cursor_antialiasing = false
  vim.g.neovide_fullscreen = true
  vim.g.neovide_remember_window_size = true
  vim.keymap("n", "<M-Enter>", function()
    if vim.g.neovide_fullscreen ~= nil and vim.g.neovide_fullscreen then
      vim.g.neovide_fullscreen = true
    else
      vim.g.neovide_fullscreen = false
    end
  end, { desc = "Toggle fullscreen in neovide" })
end

-- macros
vim.fn.setreg("d", "C#if DEBUG_SWEEPo#endifP")
