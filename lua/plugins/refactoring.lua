return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    {
      "<leader>rf",
      function()
        require("refactoring").select_refactor()
      end,
      mode = { "n", "x" },
      desc = "code Refactor",
    },
  },
  config = function()
    require("refactoring").setup()
  end,
}
