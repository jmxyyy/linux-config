return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
  dependencies = {
    -- include a picker of your choice, see picker section for more details
    { "folke/snacks.nvim", opts = { picker = { enabled = true } } },
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    cn = {
      enabled = true,
      translator = true,
      translate_problems = true,
    },
    storage = {
      home = vim.fn.expand "~/Workspace/code/leetcode/",
      cache = vim.fn.expand "~/Workspace/code/leetcode/.cache",
    },
    picker = { provider = "snacks-picker" },
    image_support = true,
    injector = {
      ["cpp"] = {
        -- imports = function() return { "#include <bits/stdc++.h>", "using namespace std;" } end,
        before = {
          "#include <bits/stdc++.h> ",
          "using namespace std;",
        },
        -- after = "int main() {}",
      },
    },
  },
}
