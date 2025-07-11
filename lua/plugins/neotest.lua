return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-vim-test",
      "vim-test/vim-test",
      "nvim-neotest/neotest-jest",
      "sidlatau/neotest-dart",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-jest")({
            jestCommand = "bun test",
            jestConfigFile = "jest.config.ts",
            env = { CI = true },
            cwd = function()
              return vim.fn.getcwd()
            end,
          }),
          require("neotest-dart")({
            command = "fvm flutter test",
            use_lsp = true,
          }),
        },
      })
      -- Use different prefix to avoid conflicts
      vim.keymap.set("n", "<leader>Tn", function()
        require("neotest").run.run()
      end, { desc = "Run nearest test" })
      vim.keymap.set("n", "<leader>Tf", function()
        require("neotest").run.run(vim.fn.expand("%"))
      end, { desc = "Run test file" })
      vim.keymap.set("n", "<leader>To", function()
        require("neotest").output.open({ enter = true, auto_close = true })
      end, { desc = "Open test output" })
      vim.keymap.set("n", "<leader>Ts", function()
        require("neotest").summary.toggle()
      end, { desc = "Toggle test summary" })
    end,
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = function(_, opts)
      opts.spec = opts.spec or {}
      vim.list_extend(opts.spec, {
        { "<leader>T", group = "Test", icon = "󰙨" },
        { "<leader>Tn", desc = "Run nearest", icon = "󰙨" },
        { "<leader>Tf", desc = "Run file", icon = "󰙨" },
        { "<leader>To", desc = "Open output", icon = "󰙨" },
        { "<leader>Ts", desc = "Toggle summary", icon = "󰙨" },
      })
    end,
  },
}
