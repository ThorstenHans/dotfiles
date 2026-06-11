return {
  "m4xshen/hardtime.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  event = "VeryLazy",
  opts = {
    enabled = true,
    disable_mouse = false,
    hint = true,
    notification = true,
    max_time = 1000,
    max_count = 3,
  },
}
