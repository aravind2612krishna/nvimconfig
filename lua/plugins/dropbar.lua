return {
  "Bekaboo/dropbar.nvim",
  -- optional, but required for fuzzy finder support
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
  },
  opts = {
    sources = {
      treesitter = {
        valid_types = {
          "class",
          "constructor",
          "function",
          "method",
          "module",
        },
      },
      path = {
        relative_to = function(_, _)
          local bufdir
          local ok, bufpath = pcall(vim.fn.expand, "%:p")
          if ok then
            ok, bufdir = pcall(vim.fs.dirname, bufpath)
          end
          return ok and bufdir or vim.fn.getcwd()
        end,
      },
    },
  },
}
