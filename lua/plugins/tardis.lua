return {
  "fredeeb/tardis.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  enable = false,
  cmd = "Tardis",
  opts = {
    keymap = {
      ["next"] = "<leader>gn", -- next entry in log (older)
      ["prev"] = "<leader>gp", -- previous entry in log (newer)
      ["quit"] = "<leader>gq", -- quit all
      ["revision_message"] = "<leader>gcm", -- show revision message for current revision
      ["commit"] = "<leader>gcc", -- replace contents of origin buffer with contents of tardis buffer
    },
    initial_revisions = 10, -- initial revisions to create buffers for
    max_revisions = 256, -- max number of revisions to load
  },
  config = function(_, opts)
    require("tardis-nvim").setup(opts)
  end,
}
