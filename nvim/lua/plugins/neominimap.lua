if true then return {} end

return {
  "Isrothy/neominimap.nvim",
  event = "VeryLazy",
  -- opts 会自动调用 require("neominimap").setup(opts)
  opts = {
    auto_enable = true,
    delay = 0,
    layout = "split",
    float = {
      minimap_width = 15, -- 悬浮窗宽度
      window_config = {
        border = "rounded", -- 圆角边框
        winblend = 15, -- 透明度
      },
    },
    split = {
      minimap_width = 15,
      fix_width = true,
    },
    sync_cursor = true,
    diagnostic = {
      enabled = true,
      severity = { vim.diagnostic.severity.INFO, vim.diagnostic.severity.ERROR },
    },
    search = {
      enabled = true,
    },
    mark = {
      enabled = true,
    },
  },
}
