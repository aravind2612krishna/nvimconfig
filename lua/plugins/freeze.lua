return {
  "AlejandroSuero/freeze-code.nvim",
  -- enabled=false,
  config = function()
    local opts = {
      freeze_path = "/home/aravk/go/bin/freeze",
      copy_cmd = "xclip -selection clipboard -t image/png",
      -- copy = true,
      open = true,

    }
    require("freeze-code").setup(opts)
  end,
}
