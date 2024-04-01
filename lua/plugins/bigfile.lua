return {
  "LunarVim/bigfile.nvim",
  opts = {
    filesize = 1, -- size of the file in MiB, the plugin round file sizes to the closest MiB
    pattern = function(bufnr, filesize_mib)
      return vim.api.nvim_buf_line_count(bufnr) > 3000 or filesize_mib > 1
    end,
    features = { -- features to disable
      "indent_blankline",
      -- "illuminate",
      -- "lsp",
      "treesitter",
      "syntax",
      "matchparen",
      -- "vimopts",
      -- "filetype",
    },
  },
  config = function(_, opts)
    require("bigfile").setup(opts)
  end,
}
