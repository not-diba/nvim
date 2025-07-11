return {
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      require("flutter-tools").setup({
        fvm = true,
        flutter_lookup_cmd = "telescope", -- use telescope to pick Flutter SDK
        dart_sdk_path = "/Users/diba/fvm/versions/stable/bin/cache/dart-sdk",
        debugger = {
          enabled = true,
          run_via_dap = true,
        },
        dev_log = {
          enabled = true,
          open_cmd = "tabedit",
        },
        widget_guides = {
          enabled = true,
        },
        lsp = {
          color = {
            enabled = true,
            background = true,
            foreground = false,
            virtual_text = true,
            virtual_text_str = "■",
          },
        },
      })

      -- Load telescope-flutter extension
      pcall(require("telescope").load_extension, "flutter")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    keys = {
      { "<leader>Fc", "<cmd>Telescope flutter commands<cr>", desc = "Flutter Commands" },
      { "<leader>Fv", "<cmd>Telescope flutter fvm<cr>", desc = "Flutter SDK via FVM" },
    },
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = function(_, opts)
      opts.spec = opts.spec or {}
      vim.list_extend(opts.spec, {
        { "<leader>F", group = "Flutter", icon = "" },
        { "<leader>Fc", "<cmd>Telescope flutter commands<cr>", desc = " Commands" },
        { "<leader>Fv", "<cmd>Telescope flutter fvm<cr>", desc = " FVM" },
      })
    end,
  },
}
