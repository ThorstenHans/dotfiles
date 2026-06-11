return {
  "nvim-telescope/telescope.nvim",
  opts = {
    pickers = {
      find_files = {
        find_command = { "fd", "--type", "f", "--hidden", "--exclude", ".git" },
      },
    },
  },
}
