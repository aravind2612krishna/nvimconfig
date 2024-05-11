return {
  "ranjithshegde/ccls.nvim",
  opts = {
    lsp = {
      -- check :help vim.lsp.start for config options
      -- server = {
      --   name = "ccls", --String name
      --   cmd = { "/home/aravk/sources/ccls/ccls/Release/ccls" }, -- point to your binary, has to be a table
      --   args = {
      --     "--log-file=ccls.log",
      --     "--log-file-append",
      --   },
      --   offset_encoding = "utf-32", -- default value set by plugin
      --   root_dir = vim.fs.dirname(vim.fs.find({ "compile_commands.json", ".git" }, { upward = true })[1]),
      --   --on_attach = your_func,
      --   --capabilites = your_table/func
      -- },
      codelens = {
        enable = true,
      },
    },
  },
  setup = function(opts)
    require("ccls").setup(opts)
  end,
}
