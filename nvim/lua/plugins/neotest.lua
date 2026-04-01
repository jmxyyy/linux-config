return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- "orjangj/neotest-ctest",
    { "alfaix/neotest-gtest", config = function() end },
    -- "haikion/neotest-gtest",
  },
  opts = function(_, opts)
    if not opts.adapters then opts.adapters = {} end
    table.insert(opts.adapters, require "neotest-gtest"(require("astrocore").plugin_opts "neotest-gtest"))
  end,
}
