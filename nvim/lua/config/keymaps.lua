-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local unmap = vim.keymap.del
-- map("n", "<localleader>-v>", "Examplecommand")
-- unmap("n", "C-h")
-- unmap("n", "C-j")
-- unmap("n", "C-k")
-- unmap("n", "C-l")
-- unmap("n", "<C-right>")
-- unmap("n", "<C-left>")
-- unmap("n", "<C-down>")
-- unmap("n", "<C-up>")
-- map("n", "<C-left>", "<cmd> TmuxNavigateLeft<CR>", { desc = "Window left" })
-- map("n", "<C-down>", "<cmd> TmuxNavigateDown<CR>", { desc = "Window down" })
-- map("n", "<C-up>", "<cmd> TmuxNavigateUp<CR>", { desc = "Window up" })
-- map("n", "<C-right>", "<cmd> TmuxNavigateRight<CR>", { desc = "Window right" })
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "Window left" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "Window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "Window up" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "Window right" })
-- map("n", "<C-<left>>", "<cmd> TmuxNavigateLeft<CR>", { desc = "Window left" })
-- map("n", "<C-<down>>", "<cmd> TmuxNavigateDown<CR>", { desc = "Window down" })
-- map("n", "<C-<up>>", "<cmd> TmuxNavigateUp<CR>", { desc = "Window up" })
-- map("n", "<C-<right>>", "<cmd> TmuxNavigateRight<CR>", { desc = "Window right" })
