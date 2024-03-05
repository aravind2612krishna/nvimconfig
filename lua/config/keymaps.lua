-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- most important
vim.keymap.set({ "i", "t" }, "jj", "<Esc>")

-- used in tmux
-- vim.keymap.del({ "n", "i", "v" }, "<A-h>")
vim.keymap.del({ "n", "i", "v" }, "<A-j>")
vim.keymap.del({ "n", "i", "v" }, "<A-k>")
vim.keymap.set("n", "<C-h>", "<C-W>h", { remap = true, desc = "Pane left" })
vim.keymap.set("n", "<C-j>", "<C-W>j", { remap = true, desc = "Pane down" })
vim.keymap.set("n", "<C-k>", "<C-W>k", { remap = true, desc = "Pane up" })
vim.keymap.set("n", "<C-l>", "<C-W>l", { remap = true, desc = "Pane right" })

vim.keymap.set("n", "<leader>e", ':e <C-R>=expand("%:p:h") . "/" <CR>', { desc = "Open :edit in dir of current file" })
vim.keymap.set(
  "n",
  "<leader>t",
  ':tabe <C-R>=expand("%:p:h") . "/" <CR>',
  { desc = "Open :tabnew in dir of current file" }
)

-- quickfix
vim.keymap.set("n", "<C-q>", vim.cmd.cclose, { desc = "Close quickfix" })
vim.keymap.set("n", "<C-e>", function()
  local currwinid = vim.fn.win_getid()
  vim.cmd([[ topleft copen ]]) -- open quickfix top left
  vim.fn.win_gotoid(currwinid) -- go back to previous window
end, { desc = "Open quickfix and jump to it" })

-- terminal
vim.keymap.set("t", "jj", "<C-\\><C-n>", { desc = "Escape" })
