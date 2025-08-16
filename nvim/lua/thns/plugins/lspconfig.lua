return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "dockerfile-language-server",
        "golangci-lint-langserver",
        "gopls",
        "rust-analyzer",
        "stylua",
        "taplo",
        "terraform-ls",
        "yaml-language-server",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      codelens = {
        enabled = true,
      },
      servers = {
        lua_ls = {
          runtime = {
            version = "LuaJIT",
            path = vim.split(package.path, ";"),
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false, -- Avoids unwanted warnings about third-party modules
          },
        },
      },
    },
  },
}
