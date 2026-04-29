return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruby_lsp = {
          root_markers = { ".git" },
        },
      },
    },
  },
}
