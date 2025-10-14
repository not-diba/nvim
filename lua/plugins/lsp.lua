-- disable pyright server since ruff is there
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          mason = false,
          autostart = false,
        },
      },
    },
  },
}
