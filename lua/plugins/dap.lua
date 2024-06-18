return {
  {
    "mfussenegger/nvim-dap",

    keys = {
      {
        "<CR>",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },
      {
        "<leader>dq",
        "<cmd>DapLoadLaunchJSON<CR>",
        desc = "Load launch.json",
      },
      {
          "<leader>de",
          function()
              require("dap").set_exception_breakpoints({ "Warning", "Error", "Exception" })
          end,
          mode = "n",
          desc = "Stop on exceptions"
      },
    },
    config = function()
      local Config = require("lazyvim.config")
      vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

      for name, sign in pairs(Config.icons.dap) do
        sign = type(sign) == "table" and sign or { sign }
        vim.fn.sign_define(
          "Dap" .. name,
          { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
        )
      end
      local dap = require("dap")
      dap.adapters.gdb = {
        type = "executable",
        command = "gdb",
        args = { "--quiet", "--interpreter=dap" },
      }
      dap.adapters.cpptools = {
        type = "executable",
        name = "cpptools",
        command = vim.fn.stdpath("data") .. "/mason/bin/OpenDebugAD7",
        args = {},
        attach = {
          pidProperty = "processId",
          pidSelect = "ask",
        },
      }
      -- dap.adapters.cppdbg = {
      --   id = "cppdbg",
      --   type = "executable",
      --   command = "/home/aravk/sources/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
      --   MIMode = "gdb",
      --   setupCommands = {
      --     {
      --       text = "source ~/.gdbinit",
      --       description = "source my init",
      --       ignoreFailures = true,
      --     },
      --   },
      -- }
      dap.configurations.cpp = {
        {
          name = "hwattach",
          type = "gdb",
          request = "attach",
          processId = require("dap.utils").pick_process,
        },
        {
          name = "hwcppattach",
          type = "cpptools",
          request = "attach",
          processId = require("dap.utils").pick_process,
          program = function()
            return vim.fn.input(
              "Path to executable: ",
              vim.fn.getcwd() .. "/../common/framework/linux64/hwx/bin/linux64/hwx",
              "file"
            )
          end,
        },
      }
    end,
  },
}
