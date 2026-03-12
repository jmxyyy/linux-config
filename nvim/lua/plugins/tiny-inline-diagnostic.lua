return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  priority = 1000,
  -- config = function()
  --   require("tiny-inline-diagnostic").setup()
  --   vim.diagnostic.config { virtual_text = false } -- Disable Neovim's default virtual text diagnostics
  -- end,
  opts = {
    -- preset = "ghost",
    options = {
      add_messages = {
        display_count = true,
      },
      multilines = {
        enabled = true,
        always_show = true,
        trim_whitespaces = true,
        tabstop = 2,
      },
      show_source = {
        enabled = true,
        if_many = true,
      },
      set_arrow_to_diag_color = true,
      softwrap = 10,
      always_show = true,
      override_open_float = true,
    },
  },
}
