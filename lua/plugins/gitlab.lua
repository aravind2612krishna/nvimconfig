return {
  "harrisoncramer/gitlab.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
    "nvim-tree/nvim-web-devicons", -- Recommended but not required. Icons in discussion tree.
  },
  build = function()
    require("gitlab.server").build(true)
  end, -- Builds the Go binary
  opts = { debug = { go_request = true, go_response = true } },
  config = function(_, opts)
    require("gitlab").setup(opts)
    vim.keymap.set("n", "gls", require("gitlab").summary)
    vim.keymap.set("n", "glA", require("gitlab").approve)
    vim.keymap.set("n", "glR", require("gitlab").revoke)
    vim.keymap.set("n", "glc", require("gitlab").create_comment)
    vim.keymap.set("v", "glc", require("gitlab").create_multiline_comment)
    vim.keymap.set("v", "glC", require("gitlab").create_comment_suggestion)
    vim.keymap.set("n", "glm", require("gitlab").move_to_discussion_tree_from_diagnostic)
    vim.keymap.set("n", "gln", require("gitlab").create_note)
    vim.keymap.set("n", "gld", require("gitlab").toggle_discussions)
    vim.keymap.set("n", "glaa", require("gitlab").add_assignee)
    vim.keymap.set("n", "glad", require("gitlab").delete_assignee)
    vim.keymap.set("n", "glra", require("gitlab").add_reviewer)
    vim.keymap.set("n", "glrd", require("gitlab").delete_reviewer)
    vim.keymap.set("n", "glp", require("gitlab").pipeline)
    vim.keymap.set("n", "glo", require("gitlab").open_in_browser)
  end,
  keys = {
    { "glr", function() require('gitlab').review() end, mode="n", desc="Open review" },
  },
}
