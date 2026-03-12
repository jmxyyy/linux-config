return {
  "noir4y/comment-translate.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  -- config = function() require("comment-translate").setup {} end,
  opts = {
    target_language = "zh-CN",
    translate_service = "google", -- 'google' or 'llm'

    hover = {
      enabled = true,
      delay = 500,
      auto = false,
    },

    immersive = {
      enabled = false,
    },

    cache = {
      enabled = true,
      max_entries = 1000,
    },
    targets = {
      comment = true,
      string = true,
    },
    keymaps = {},
  },
}
