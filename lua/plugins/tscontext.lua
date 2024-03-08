return {
  "nvim-treesitter/nvim-treesitter-context",
  opts = {
    enable = false, -- Enable this plugin (Can be enabled/disabled later via commands)
    throttle = true, -- Throttles plugin updates (may improve performance)
    max_lines = 4, -- How many lines the window should span. Values <= 0 mean no limit.
    multiline_threshold = 1, -- Maximum number of lines to show for a single context
    trim_scope = "inner", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    mode = "topline", -- Line used to calculate context. Choices: 'cursor', 'topline'
    separator = nil,
    patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
      -- For all filetypes
      -- Note that setting an entry here replaces all other patterns for this entry.
      -- By setting the 'default' entry below, you can control which nodes you want to
      -- appear in the context window.
      default = {
        "class",
        "function",
        "method",
        "for",
        "while",
        "if",
        "else",
        "switch",
        "case",
        "interface",
        "struct",
        "enum",
      },
      -- Example for a specific filetype.
      -- If a pattern is missing, *open a PR* so everyone can benefit.
      --   rust = {
      --       'impl_item',
      --   },
    },
    config = function(_, opts)
        require'treesitter-context'.setup(opts)
        vim.cmd[[hi! link TreesitterContextBottom underlined]]
    end
  },
}
