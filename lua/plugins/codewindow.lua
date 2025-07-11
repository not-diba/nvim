return {
  {
    "gorbit99/codewindow.nvim",
    event = "VeryLazy",
    config = function()
      local codewindow = require("codewindow")
      codewindow.setup({
        auto_enable = true,
        exclude_filetypes = { "NvimTree", "lazy", "TelescopePrompt" },
      })
      codewindow.apply_default_keybinds()
      -- Toggle minimap keybinding
      vim.keymap.set("n", "<leader>mm", codewindow.toggle_minimap, { desc = "Toggle Minimap" })
    end,
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = function(_, opts)
      opts.spec = opts.spec or {}
      vim.list_extend(opts.spec, {
        { "<leader>m", group = "Minimap", icon = "" },
        { "<leader>mm", desc = "Toggle Minimap", icon = "" },
      })
    end,
  },
}
