return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Ensure mason installs the server
        -- ccls = {
        --   mason = false,
        --   root_dir = function(fname)
        --     return require("lspconfig.util").root_pattern(
        --       "Makefile",
        --       "configure.ac",
        --       "configure.in",
        --       "config.h.in",
        --       "meson.build",
        --       "meson_options.txt",
        --       "build.ninja"
        --     )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(
        --       fname
        --     ) or require("lspconfig.util").find_git_ancestor(fname)
        --   end,
        --   cmd = {
        --     "/home/aravk/sources/ccls/ccls/Release/ccls",
        --     "--log-file=ccls.log",
        --     "--log-file-append",
        --   },
        --   init_options = {
        --     -- compilationDatabaseDirectory = ".",
        --     index = {
        --       threads = 6,
        --     },
        --     clang = {
        --       excludeArgs = { "-frounding-math" },
        --     },
        --   },
        -- },
        clangd = {
          keys = {
            { "<leader>cR", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
          },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern(
              "Makefile",
              "configure.ac",
              "configure.in",
              "config.h.in",
              "meson.build",
              "meson_options.txt",
              "build.ninja"
            )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(
              fname
            ) or require("lspconfig.util").find_git_ancestor(fname)
          end,
          capabilities = {
            offsetEncoding = { "utf-16" },
          },
          cmd = {
            "clangd",
            "--background-index",
            "-j=4",
            "--clang-tidy",
            "--enable-config",
            "--header-insertion=never",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--include-ineligible-results",
          },
          init_options = {
            usePlaceholders = true,
            completeUnimported = true,
            clangdFileStatus = true,
          },
        },
      },
      inlay_hints = { enabled = false },
      setup = {
        clangd = function(_, opts)
          local clangd_ext_opts = require("lazyvim.util").opts("clangd_extensions.nvim")
          if clangd_ext_opts ~= nil then
              local coq = require("coq")
              if coq ~= nil then
                  require("clangd_extensions").setup(vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = coq.lsp_ensure_capabilities(opts) }))
              else
                  require("clangd_extensions").setup(vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = opts }))
              end
              return false
          end
        end,
      },
    },
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- change a keymap
      keys[#keys + 1] = {
        "gd",
        function()
          require("telescope.builtin").lsp_definitions({ reuse_win = false })
        end,
        desc = "Goto Definition",
        has = "definition",
      }
      local config = require("lazyvim.plugins.lsp.keymaps").get()
    end,
  },
}
