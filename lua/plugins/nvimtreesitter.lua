return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    indent = { enable = false },
    highlight = {
        enable = false,
      -- enable = function(_, bufnr) -- Disable in large C++ bufs
      -- --   return vim.api.nvim_buf_line_count(bufnr) < 1000
      -- end,
    },
  },
}
