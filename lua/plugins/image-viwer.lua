return {
  {
    "adelarsq/image_preview.nvim",
    event = "VeryLazy",
    config = function()
      require("image_preview").setup()
      -- Preview image keymap
      vim.keymap.set("n", "<leader>pi", function()
        require("image_preview").PreviewImage(vim.fn.expand("%:p"))
      end, { desc = "󰸵 Preview image" })
    end,
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = function(_, opts)
      opts.spec = opts.spec or {}
      vim.list_extend(opts.spec, {
        { "<leader>p", group = "Preview", icon = "" },
        { "<leader>pi", desc = "Image", icon = "󰥶" },
      })
    end,
  },
}
