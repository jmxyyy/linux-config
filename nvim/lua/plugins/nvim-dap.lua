if true then return {} end
return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require "dap"

    -- CPP
    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = "codelldb",
        args = { "--port", "${port}" },
      },
    }
    local last_executable = nil
    dap.configurations.cpp = {
      {
        name = "Launch codelldb",
        type = "codelldb",
        request = "launch",
        -- program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end,
        program = function()
          local file = vim.fn.expand "%:p"
          local executable = vim.fn.expand "%:p:r"
          local compile_cmd = string.format("g++ -g -O0 -std=c++23 '%s' -o '%s'", file, executable)
          local _ = vim.fn.system(compile_cmd)
          if vim.v.shell_error ~= 0 then return dap.ABORT end
          last_executable = executable
          return executable
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        exceptionBreakpoints = {},
      },
    }
    dap.configurations.rust = dap.configurations.cpp

    local function cleanup()
      if last_executable and vim.fn.filereadable(last_executable) == 1 then
        os.remove(last_executable)
        -- print("清理构建文件: " .. last_executable)
        last_executable = nil
      end
    end

    -- 监听调试终止事件 (比如手动停止或程序运行结束)
    dap.listeners.after.event_terminated["my_cleanup"] = function() cleanup() end

    -- 监听调试退出事件
    dap.listeners.after.event_exited["my_cleanup"] = function() cleanup() end
  end,
}
