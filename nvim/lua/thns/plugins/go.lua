return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      gopls = {
        settings = {
          gopls = {
            -- Keep completion behavior consistent with the Rust setup: accept a
            -- function without dumping parameter placeholders at the cursor.
            -- (LazyVim's Go extra enables this by default.)
            usePlaceholders = false,
            analyses = {
              -- Flag variables that shadow an outer declaration. Merges with
              -- the analyses LazyVim already enables (nilness, unusedparams,
              -- unusedwrite, useany); staticcheck stays on too.
              shadow = true,
            },
          },
        },
      },
    },
  },
}
