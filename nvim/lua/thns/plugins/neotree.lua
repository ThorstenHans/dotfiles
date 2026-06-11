return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  init = function()
    vim.api.nvim_create_autocmd("BufEnter", {
      group = vim.api.nvim_create_augroup("neotree_start_directory", { clear = true }),
      once = true,
      callback = function()
        local stats = vim.uv.fs_stat(vim.api.nvim_buf_get_name(0))
        if stats and stats.type == "directory" then
          vim.cmd("cd " .. vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)))
          vim.cmd("enew")
        end
      end,
    })
  end,
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
