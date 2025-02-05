-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local home_path = vim.fn.expand("$HOME")
local o = vim.o
local g = vim.g
--
g.python3_host_prog = home_path .. "/miniconda3/bin/python3"
o.encoding = "utf-8"
o.cursorline = true
o.foldmethod = "expr"
o.cursorcolumn = true
--
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
o.termguicolors = true
o.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
--
--
o.wrap = true
--
o.textwidth = 80
--
o.formatoptions = "tcro"
o.tabstop = 4
o.shiftwidth = 2
o.expandtab = true
o.listchars = "tab:  ,eol:↵,trail:~,nbsp:.,extends:>,precedes:<,"
o.list = true
o.autoindent = true
o.showtabline = 2
o.mouse = "n"
o.undofile = true
o.undodir = home_path .. "/.nvim/.undodir//"
o.winbar = "%=%m %f"

-- g.vimtex_view_method = "zathura"
g.vimtex_view_method = "zathura_simple"
g.vimtex_view_general_viewer = "zathura"
g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"
g.vimtex_compiler_method = "latexmk"
o.ignorecase = true

vim.filetype.add({ pattern = { [".*.ipynb"] = "ipynb" } })
vim.filetype.add({ pattern = { [".*.CR1X"] = "vb" } })
vim.filetype.add({ pattern = { [".*.cr1x"] = "vb" } })
vim.filetype.add({ pattern = { ["[Dd]ockerfile.*"] = "dockerfile" } })
