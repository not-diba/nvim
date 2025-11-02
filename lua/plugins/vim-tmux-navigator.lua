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
      { "<C-h>", "<cmd><C-U>TmuxNavigateLeft<cr>", desc = "Tmux Left" },
      { "<C-j>", "<cmd><C-U>TmuxNavigateDown<cr>", desc = "Tmux Down" },
      { "<C-k>", "<cmd><C-U>TmuxNavigateUp<cr>", desc = "Tmux Up" },
      { "<C-l>", "<cmd><C-U>TmuxNavigateRight<cr>", desc = "Tmux Right" },
      { "<C-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>", desc = "Tmux Previous" },
    }
  end,
}
