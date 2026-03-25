if true then return {} end

return {
  "catppuccin/nvim",
  name = "catppuccin",
  opts = {
    flavour = "mocha",
    color_overrides = {
      mocha = {
        -- 背景与底层 UI (映射 NvChad 的 black, darker_black)
        base = "#1E1D2D", -- NvChad 的正常背景黑
        mantle = "#191828", -- 更深的黑，用于侧边栏等
        crust = "#14131C", -- 极深色，用于浮动窗口边缘 (根据比例稍微调深一点)

        -- 表面与过渡色 (映射 one_bg, grey 等)
        surface0 = "#252434", -- black2
        surface1 = "#2d2c3c", -- one_bg
        surface2 = "#363545", -- one_bg2
        overlay0 = "#474656", -- grey
        overlay1 = "#555464", -- grey_fg2
        overlay2 = "#605f6f", -- light_grey

        -- 文本颜色 (映射 white 和 base16 里的浅色)
        text = "#D9E0EE", -- white
        subtext1 = "#ccd3e1", -- base06
        subtext0 = "#bfc6d4", -- base05

        -- 高亮彩色提取
        red = "#F38BA8",
        pink = "#F5C2E7",
        flamingo = "#ffa5c3", -- baby_pink
        mauve = "#c7a0dc", -- dark_purple
        peach = "#F8BD96", -- orange
        yellow = "#FAE3B0",
        green = "#ABE9B3",
        teal = "#B5E8E0",
        sky = "#89DCEB", -- cyan
        sapphire = "#8bc2f0", -- nord_blue
        blue = "#89B4FA",
        lavender = "#c7d1ff",
      },
    },

    -- 2. 完美复现 NvChad 里的 `M.polish_hl` (特定语法高亮覆盖)
    custom_highlights = function(colors)
      return {
        ["@variable"] = { fg = colors.lavender },
        ["@property"] = { fg = colors.teal },
        ["@variable.builtin"] = { fg = colors.red },
      }
    end,
  },
}
