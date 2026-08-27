return {
  "ibhagwan/fzf-lua",
  opts = {
    files = {
      -- Include hidden files in file search, but skip the .git directory.
      fd_opts = "--color=never --type f --hidden --follow --exclude .git",
    },
  },
}
