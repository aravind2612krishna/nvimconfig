return {
  "ms-jpq/coq_nvim",
  branch = "coq",
  lazy = false,
  build = ":COQdeps",
  dependencies = {
    { "ms-jpq/coq.artifacts", branch = "artifacts" },
    { "ms-jpq/coq.thirdparty", branch = "3p" },
  },
  init = function()
    vim.g.coq_settings = {
      keymap = {
        recommended = true,
        pre_select = true,
        jump_to_mark = "\\",
      },
      display = {
        mark_highlight_group = "Folded",
        ["pum.fast_close"] = false,
        ["ghost_text.context"] = {"", ""},
      },
      auto_start = "shut-up",
    }
  end,
  config = function()
    -- extra config here
  end,
}
