return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    indent = { enable = false },
    highlight = {
      disable = function(lang, bufnr) -- Disable in large C++ bufs
        return lang == "cpp" and vim.api.nvim_buf_line_count(bufnr) > 3000
      end,
    },
  },
}
