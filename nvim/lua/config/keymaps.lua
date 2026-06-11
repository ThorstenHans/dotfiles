local keymap = vim.keymap
keymap.set("i", "jk", "<ESC>", { desc = "Exit Insert mode" })
keymap.set("n", "<leader>e",  "<cmd>Neotree focus<CR>",   { desc = "Focus NeoTree" })
keymap.set("n", "<leader>fk", "<cmd>FzfLua keymaps<cr>", { desc = "Find Keymaps" })

keymap.set({ "n", "v", "i" }, "<Up>",    function() vim.notify("USE k, YOU COWARD!", vim.log.levels.WARN) end, { desc = "Arrow key shame" })
keymap.set({ "n", "v", "i" }, "<Down>",  function() vim.notify("j IS RIGHT THERE. WHAT IS WRONG WITH YOU?", vim.log.levels.WARN) end, { desc = "Arrow key shame" })
keymap.set({ "n", "v", "i" }, "<Left>",  function() vim.notify("h. IT'S LITERALLY ONE KEY. USE IT.", vim.log.levels.WARN) end, { desc = "Arrow key shame" })
keymap.set({ "n", "v", "i" }, "<Right>", function() vim.notify("l. ARE YOU SERIOUS RIGHT NOW?", vim.log.levels.WARN) end, { desc = "Arrow key shame" })
