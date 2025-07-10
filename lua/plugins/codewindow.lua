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

      -- Register with which-key under <leader>m
      local wk_ok, wk = pcall(require, "which-key")
      if wk_ok then
        wk.register({
          ["<leader>m"] = {
            name = "+minimap",
            m = { "<cmd>lua require('codewindow').toggle_minimap()<cr>", "Toggle Minimap" },
          },
        })
      end
    end,
  },
}
