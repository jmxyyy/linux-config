if true then return {} end
return {
  "xeluxee/competitest.nvim",
  dependencies = "MunifTanjim/nui.nvim",
  lazy = true,
  -- config = function() require("competitest").setup() end,
  opts = {
    split_ui = {
      position = "left",
    },
    compile_command = {
      cpp = { exec = "g++", args = { "-Wall", "-std=c++23", "-o2", "$(FNAME)", "-o", "./build/$(FNOEXT)" } },
    },
    run_command = {
      cpp = { exec = "./build/$(FNOEXT)" },
    },
    view_output_diff = true,
  },
}
