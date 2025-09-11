-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "vv", "<C-w>v")
vim.keymap.set("n", "ss", "<C-w>s")

vim.keymap.set("n", "0", "^", { noremap = true })
vim.keymap.set("n", "^", "0", { noremap = true })
