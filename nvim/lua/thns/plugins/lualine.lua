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
            require("noice").api.statusline.mode.get,
            cond = require("noice").api.statusline.mode.has,
            color = { fg = "#ff9e64" },
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
