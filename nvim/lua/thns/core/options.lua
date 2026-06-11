local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- search
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if mixed casing used in search, search is case-sensitive

opt.cursorline = true -- hightlight the current cursor line
opt.scrolloff = 4

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
opt.clipboard = vim.env.SSH_CONNECTION and "" or "unnamedplus"

-- configure split behavior
opt.splitright = true -- vertical splits go to the right
opt.splitbelow = true -- horizontal splits go to the bottom

-- vim Swap file handling
opt.swapfile = false
