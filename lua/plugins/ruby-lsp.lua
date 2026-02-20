return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruby_lsp = {
          cmd = { "/Users/diba/.rbenv/shims/ruby-lsp" },
          init_options = {
            formatter = "auto",
            linters = { "rubocop" },
          },
        },
      },
    },
  },
}
