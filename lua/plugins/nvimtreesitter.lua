return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    indent = { enable = false },
    highlight = {
      disable = function(_, bufnr) -- Disable in large C++ bufs
        return vim.api.nvim_buf_line_count(bufnr) > 3000
      end,
    },
  },
}
