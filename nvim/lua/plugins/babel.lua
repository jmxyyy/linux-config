if true then return {} end

return {
  "acidsugarx/babel.nvim",
  version = "*", -- recomended for the latest tag, not main
  opts = {
    target = "zh-CN", -- target language
  },
  keys = {
    { "<leader>tr", mode = "v", desc = "Translate selection" },
    { "<leader>tw", desc = "Translate word" },
  },
}
