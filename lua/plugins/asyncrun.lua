return {
  "skywind3000/asyncrun.vim",
  lazy = true,
  cmd = { "AsyncRun" },
  keys = {
    {
      "<leader>r",
      '<cmd>AsyncRun ug -RniI <C-R><C-W> <C-R>=expand("%:.:h")<CR>',
      mode = "n",
      desc = "grep in relative dir",
    },
  },
}
