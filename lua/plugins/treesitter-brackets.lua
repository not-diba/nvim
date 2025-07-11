return {
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "VeryLazy",
    config = function()
      -- Uses default config, works out-of-the-box
      require("rainbow-delimiters.setup").setup()
    end,
  },
}
