return {
  "SergioRibera/codeshot.nvim",
  config = function()
    require("codeshot").setup({
      copy = "%c | xclip -selection clipboard -t image/png",
    })
  end,
}
