return {
  {
    "CRAG666/code_runner.nvim",
    config = true,
    keys = {
      { "<leader>rr", ":RunCode<CR>", desc = "Run Code" },
      { "<leader>rf", ":RunFile<CR>", desc = "Run File" },
      { "<leader>rt", ":RunFile tab<CR>", desc = "Run File in Tab" },
      { "<leader>rp", ":RunProject<CR>", desc = "Run Project" },
      { "<leader>rc", ":RunClose<CR>", desc = "Close Runner" },
      { "<leader>crf", ":CRFiletype<CR>", desc = "Set Filetype Runner" },
      { "<leader>crp", ":CRProjects<CR>", desc = "Set Project Runner" },
    },
  },

  {
    "folke/which-key.nvim",
    optional = true,
    opts = function(_, opts)
      opts.spec = opts.spec or {}
      vim.list_extend(opts.spec, {
        { "<leader>r", group = "Run", icon = "" },
        { "<leader>cr", group = "CodeRunner Config", icon = "" },
      })
    end,
  },
}
