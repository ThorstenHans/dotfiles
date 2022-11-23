-- buffer config
--
--
--
vim.g.mapleader = " "


local set = vim.opt

set.relativenumber = true

set.softtabstop = 2
set.expandtab = true
set.shiftwidth = 2
set.cursorline = true 

set.termguicolors = true
set.showmatch = true
set.hlsearch = true
set.ignorecase = true

vim.cmd('colorscheme base16-rose-pine-moon')
require('thns.keybinds')
require('thns.settings')
require('thns.plugins')

