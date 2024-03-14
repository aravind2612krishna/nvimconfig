return {
  "skywind3000/asyncrun.vim",
  lazy = true,
  cmd = { "AsyncRun" },
  keys = {
    {
      "<leader>rr",
      function()
        local bufnr = vim.api.nvim_get_current_buf()
        local cmd = "AsyncRun ug -RniI " .. vim.fn.expand("<cword>") .. " " .. vim.fn.expand("%:.:h")
        vim.cmd(cmd)
        vim.fn.histadd("cmd", cmd)
        local currwinid = vim.fn.win_getid()
        vim.cmd([[ topleft copen ]]) -- open quickfix top left
        vim.fn.win_gotoid(currwinid) -- go back to previous window

        -- vim.api.nvim_exec(
        --   [[
        -- :AsyncRun ug -RniI <C-R><C-W> <C-R>=expand("%:.:h")
        -- ]],
        --   false
        -- )
      end,
      mode = "n",
      desc = "grep in relative dir",
    },
  },
}
