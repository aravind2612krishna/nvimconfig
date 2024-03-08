return {
  "shellRaining/hlchunk.nvim",
  enabled = false,
  event = { "UIEnter" },
  config = function()
    require("hlchunk").setup({})
  end
}
