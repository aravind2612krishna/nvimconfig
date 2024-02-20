return {
  "stevearc/conform.nvim",
  opts = {
    -- LazyVim will use these options when formatting with the conform.nvim formatter
    format = {
      timeout_ms = 30000,
      async = false, -- not recommended to change
      quiet = false, -- not recommended to change
    },
    formatters_by_ft = {
      lua = { "stylua" },
      fish = { "fish_indent" },
      sh = { "shfmt" },
      json = { "fixjson" },
      javascript = { "prettier" },
      cpp = { "clang-format" },
      python = { "black" },
    },
    -- The options you set here will be merged with the builtin formatters.
    -- You can also define any custom formatters here.
    formatters = {
      injected = { options = { ignore_errors = true } },
      fixjson = {
        command = "fixjson",
        args = {
          "-w",
          "--stdin-filename",
        },
        stdin = true,
      },
      -- # Example of using dprint only when a dprint.json file is present
      -- dprint = {
      --   condition = function(ctx)
      --     return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
      --   end,
      -- },
      --
      -- # Example of using shfmt with extra args
      -- shfmt = {
      --   prepend_args = { "-i", "2", "-ci" },
      -- },
    },
  },
}
