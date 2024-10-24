local opt = vim.opt

opt.relativenumber = false -- enable relative line numberse
opt.number = false -- show absolute line number for current line

-- search
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if mixed casing used in search, search is case-sensitive

opt.cursorline = true -- hightlight the current cursor line

-- line wrapping
opt.wrap = false

-- tabs and indention
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- appearance
opt.termguicolors = true
opt.background = "dark" -- if the colorscheme supports dark-mode use that one by default
opt.signcolumn = "yes" -- show sign column

-- system clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default

-- configure split behavior
opt.splitright = true -- vertical splits go to the right
opt.splitbelow = true -- horizontal splits go to the bottom

-- vim Swap file handling
opt.swapfile = false
