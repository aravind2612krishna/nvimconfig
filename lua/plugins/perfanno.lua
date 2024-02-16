return {
  "t-troebst/perfanno.nvim",
  opts = {},
  config = function(_, opts)
      require("perfanno").setup(opts)
  end
}
