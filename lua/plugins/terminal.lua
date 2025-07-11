return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<c-\>]],
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        direction = "horizontal", -- "vertical" | "float"
        float_opts = {
          border = "curved",
        },
      })
      -- Keymaps for different terminal directions
      vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Terminal (Horizontal)" })
      vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Terminal (Vertical)" })
      vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Terminal (Floating)" })
    end,
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = function(_, opts)
      opts.spec = opts.spec or {}
      vim.list_extend(opts.spec, {
        { "<leader>t", group = "Terminal", icon = "" },
        { "<leader>tt", desc = "Horizontal", icon = "󰹴" },
        { "<leader>tv", desc = "Vertical", icon = "󰹵" },
        { "<leader>tf", desc = "Floating", icon = "󰹻" },
      })
    end,
  },
}
