return {
  "nvim-lualine/lualine.nvim",
  opts = {
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      lualine_x = {
        {
          function()
            return require("noice").api.status.mode.get()
          end,
          cond = function()
            return package.loaded["noice"] and require("noice").api.status.mode.has()
          end,
          color = function()
            return { fg = Snacks.util.color("Constant") }
          end,
        },
        {
          require("lazy.status").updates,
          cond = require("lazy.status").has_updates,
          color = { fg = "#ff9e65" },
        },
        { "filetype" },
        { "encoding" },
        { "fileformat" },
      },
    },
  },
}
