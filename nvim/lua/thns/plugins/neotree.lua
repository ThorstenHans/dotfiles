return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    default_component_configs = {
      git_status = {
        symbols = {
          untracked = "",
          unstaged = "",
          conflict = "",
          staged = "",
          ignored = "",
        },
      },
    },
  },
}
