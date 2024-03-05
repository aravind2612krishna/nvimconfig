return {
  "mistricky/codesnap.nvim",
  build = "make",
  opts = {
    mac_window_bar = true, -- MacOS style title bar switch
    opacity = true, -- The code snap has some opacity by default, set it to false for 100% opacity
    watermark = "aravk", -- (Optional) you can custom your own watermark, but if you don't like it, just set it to nil
  },
  config = function(_, opts)
    require("codesnap").setup(opts)
  end,
}
