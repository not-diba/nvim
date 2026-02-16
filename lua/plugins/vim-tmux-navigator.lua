return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
    "TmuxNavigatorProcessList",
  },
  keys = function()
    -- Remove any existing <C-h/j/k/l> keymaps first
    for _, key in ipairs({ "<C-h>", "<C-j>", "<C-k>", "<C-l>", "<C-\\>" }) do
      pcall(vim.keymap.del, "n", key)
    end

    return {
      { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Tmux Left" },
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Tmux Down" },
      { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Tmux Up" },
      { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Tmux Right" },
      { "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", desc = "Tmux Previous" },
    }
  end,
}
