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
      menu = {
        border = "rounded",
        draw = {
          columns = {
            { "kind_icon" },
            { "label", "label_description", gap = 1 },
            { "kind" },
          },
          components = {
            kind = {
              highlight = function(ctx) return "BlinkCmpKind" .. ctx.kind end,
            },
          },
        },
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
      keymap = {
        ["<Tab>"] = { "accept", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
      },
    },
  },
}
