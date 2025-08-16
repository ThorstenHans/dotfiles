return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    close_if_last_window = true,
    enable_git_status = true,
    window = {
      position = "right",
      width = 30,
    },
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
