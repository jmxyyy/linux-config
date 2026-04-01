return {
  "nvzone/floaterm",
  dependencies = {
    { "nvzone/volt", lazy = true },
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        maps.n["<C-'>"] = { "<Cmd>FloatermToggle<CR>", desc = "Toggle Floaterm" }
      end,
    },
  },
  cmd = "FloatermToggle",
  opts = {
    border = false,
  },
}
