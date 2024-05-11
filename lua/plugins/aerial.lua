return {
  "stevearc/aerial.nvim",
  keys = {
    {
      "<leader>at",
      function()
        require("aerial").toggle()
      end,
      desc = "Symbols outline",
    },
  },
  opts = function()
    local opts = {
      attach_mode = "global",
      backends = { "lsp", "treesitter", "markdown", "man" },
      layout = { min_width = 28 },
      show_guides = true,
      filter_kind = false,
      guides = {
        mid_item = "├ ",
        last_item = "└ ",
        nested_top = "│ ",
        whitespace = "  ",
      },
      keymaps = {
        ["[y"] = "actions.prev",
        ["]y"] = "actions.next",
        ["[Y"] = "actions.prev_up",
        ["]Y"] = "actions.next_up",
        ["{"] = false,
        ["}"] = false,
        ["[["] = false,
        ["]]"] = false,
      },
    }

    opts.disable_max_lines = 5000

    return opts
  end,
}
