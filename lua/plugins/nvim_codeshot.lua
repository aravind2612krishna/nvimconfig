return {
  "Ofadiman/nvim-codeshot",
  enable=false,
  config = function()
    vim.keymap.set("v", "<leader>ua", function()
      vim.cmd(":CodeshotScreenshot")
    end, { noremap = true, silent = true, nowait = true })
  end,
}
