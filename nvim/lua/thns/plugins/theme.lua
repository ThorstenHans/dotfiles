return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {
      style = "storm",
      on_highlights = function(hl, c)
        -- bg_dark is already the storm default for floats, so go darker to stand out
        local float_bg = "#13141d"
        hl.NormalFloat      = { bg = float_bg, fg = c.fg }
        hl.FloatBorder      = { bg = float_bg, fg = c.blue }
        -- Noice renders hover via its own groups; set them explicitly
        hl.NoicePopup       = { bg = float_bg, fg = c.fg }
        hl.NoicePopupBorder = { bg = float_bg, fg = c.blue }
      end,
    },
  },
}
