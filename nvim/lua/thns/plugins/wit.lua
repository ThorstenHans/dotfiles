return {
  -- Register the `.wit` filetype (not built into Neovim yet).
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.filetype.add({ extension = { wit = "wit" } })
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "wit")
    end,
  },
}
