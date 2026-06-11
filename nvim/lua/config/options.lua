local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- search
opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true
opt.scrolloff = 4

opt.wrap = false

-- tabs and indention
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- system clipboard
opt.clipboard = vim.env.SSH_CONNECTION and "" or "unnamedplus"

-- split behavior
opt.splitright = true
opt.splitbelow = true

opt.swapfile = false
opt.timeoutlen = 300
