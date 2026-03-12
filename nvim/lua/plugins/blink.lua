return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  -- build = "cargo build --release", -- for delimiters
  -- all modules handle lazy loading internally
  lazy = false,
  opts = {
    chartoggle = { enabled = true },
    tree = { enabled = true },
    completion = {
      documentation = {
        auto_show = true,
      },
      ghost_text = {
        enabled = false,
      },
    },
    cmdline = {
      completion = {
        menu = {
          auto_show = function(ctx) return vim.fn.getcmdtype() == ":" end,
        },
        ghost_text = {
          enabled = true,
        },
      },
    },
  },
}
