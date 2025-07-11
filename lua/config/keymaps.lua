-- Preview image keymap
vim.keymap.set("n", "<leader>pi", function()
  require("image_preview").PreviewImage(vim.fn.expand("%:p"))
end, { desc = "󰸵 Preview image" })

-- Which-key registration (add this to your which-key config)
return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = function(_, opts)
      opts.spec = opts.spec or {}
      vim.list_extend(opts.spec, {
        { "<leader>p", group = "Preview", icon = "󰸵" },
        { "<leader>pi", desc = "Image", icon = "󰸵" },
      })
    end,
  },
}
