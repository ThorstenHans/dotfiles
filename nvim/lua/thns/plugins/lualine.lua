return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local ll = require("lualine")
    local lazy_status = require("lazy.status")
    ll.setup({
      sections = {
        lualine_a = {
          { "mode" },
        },
        lualine_b = {
          { "branch" },
        },
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
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e65" },
          },
          { "filetype" },
          { "encoding" },
          { "fileformat" },
        },
      },
    })
  end,
}
