return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "dockerfile-language-server",
        "gopls",
        "golangci-lint-langserver",
        "yaml-language-server",
        "terraform-ls",
        "rust-analyzer",
        "stylua",
        "taplo",
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
      servers = {},
    },
  },
}
