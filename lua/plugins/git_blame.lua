return {
  "f-person/git-blame.nvim",
  config = function(_, _)
    vim.g.gitblame_delay = 50
    vim.g.gitblame_virtual_text_column = 80
    require("gitblame").setup()
  end,
}
