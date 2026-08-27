return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        -- Long rust-analyzer messages used to run off-screen as single-line
        -- virtual text. Instead, render the full, wrapped message on lines
        -- below the code, but only for the line the cursor is on.
        virtual_text = false,
        virtual_lines = { current_line = true },
      },
      inlay_hints = { enabled = false },
      codelens = {
        enabled = true,
      },
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
            },
          },
        },
      },
    },
  },
}
