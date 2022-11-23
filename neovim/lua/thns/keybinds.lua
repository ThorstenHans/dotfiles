local default_opts = { noremap = true, silent = true }

local map = vim.api.nvim_set_keymap

-- exit insert and terminal mode using jk
map('i', 'jk', '<ESC>', default_opts)
map('t', 'jk', '<ESC>', default_opts)
