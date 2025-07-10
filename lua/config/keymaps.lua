-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Format file
-- Format file
-- Format keymap
vim.keymap.set({ "n", "v" }, "<C-f>", function()
  vim.lsp.buf.format({ async = true })
end, { noremap = true, silent = true, desc = "󰉿 Format file" })

-- Preview image keymap
vim.keymap.set("n", "<leader>pi", function()
  require("image_preview").PreviewImage(vim.fn.expand("%:p"))
end, { desc = "󰋩 Preview image" })
