return {
  "mrcjkb/rustaceanvim",
  opts = {
    server = {
      default_settings = {
        ["rust-analyzer"] = {
          -- The "N implementations" / "N references" code lenses attach to the
          -- item's declaration line, i.e. between #[derive(...)] and `struct`,
          -- which reads oddly. Turn them off and use `gri`/`grr`/Trouble on
          -- demand instead. Run/debug lenses stay enabled by default.
          lens = {
            implementations = { enable = false },
            references = {
              adt = { enable = false },
              enumVariant = { enable = false },
              method = { enable = false },
              trait = { enable = false },
            },
          },
          completion = {
            -- Default "fill_arguments" inserts argument-name placeholders right
            -- at the cursor when accepting a function completion. Just add the
            -- parentheses and drop the cursor inside instead.
            callable = { snippets = "add_parentheses" },
          },
        },
      },
    },
  },
}
