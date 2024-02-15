-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- used in tmux
-- vim.keymap.del({ "n", "i", "v" }, "<A-h>")
vim.keymap.del({ "n", "i", "v" }, "<A-j>")
vim.keymap.del({ "n", "i", "v" }, "<A-k>")
-- vim.keymap.del({ "n", "i", "v" }, "<A-l>")

vim.keymap.set("i", "jj", "<Esc>")
