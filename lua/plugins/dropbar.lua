return {
  "Bekaboo/dropbar.nvim",
  -- optional, but required for fuzzy finder support
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
  },
  opts = {
    general = {
      enable = function(buf, win)
        return vim.fn.win_gettype(win) == ""
          and vim.wo[win].winbar == ""
          and vim.bo[buf].bt == ""
          and vim.api.nvim_get_option_value("diff", {}) == false
          and (
            vim.bo[buf].ft == "markdown"
            or (
              buf
                and vim.api.nvim_buf_is_valid(buf)
                and (pcall(vim.treesitter.get_parser, buf, vim.bo[buf].ft))
                and true
              or false
            )
          )
      end,
    },
    sources = {
      treesitter = {
        valid_types = {
          "class",
          "constructor",
          "function",
          "method",
          "module",
        },
      },
      path = {
        relative_to = function(_, _)
          local bufdir
          local ok, bufpath = pcall(vim.fn.expand, "%:p")
          if ok then
            ok, bufdir = pcall(vim.fs.dirname, bufpath)
          end
          return ok and bufdir or vim.fn.getcwd()
        end,
      },
    },
  },
}
