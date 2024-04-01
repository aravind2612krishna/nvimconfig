return {
  "wellle/context.vim",
  keys = {
    { "<C-[>", "<cmd>ContextPeek<cr>", mode = "n", desc = "Peek the context" },
  },
  config = function()
    vim.g.context_enabled = 0
    vim.g.context_add_mappings = 0
    vim.g.context_add_autocmds = 1
    vim.g.context_border_char = "┈"
    -- vim.g.context_border_char = "━"
    vim.g.context_highlight_normal = "Directory"
    vim.g.context_highlight_border = "ErrorMsg"
    vim.g.context_max_per_indent = 3
    vim.g.context_nvim_no_redraw = 1
    -- nnoremap <C-[> <cmd>ContextPeek<CR>
    vim.g.context_highlight_normal = "Directory"
  end,
}
