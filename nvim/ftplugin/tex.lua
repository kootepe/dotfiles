local o = vim.o
local g = vim.g
local map = vim.keymap.set
map("n", "<leader>vc", "<Plug>(vimtex-compile)", { desc = "Vimtex Compile" })
map("n", "<leader>vv", "<Plug>(vimtex-view)", { desc = "Vimtex View" })

g.vimtex_indent_lists = {}
