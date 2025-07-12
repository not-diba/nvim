return {
  -- Add Tokyo Night colorscheme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      -- Choose style: "storm", "moon", "night", "day"
      style = "moon",

      -- Enable transparent background
      transparent = false,

      -- Configure styles for different syntax groups
      styles = {
        -- Style to be applied to different syntax groups
        comments = { italic = true },
        keywords = { italic = true },
        functions = { italic = true },
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "dark", -- style for sidebars, see below
        floats = "dark", -- style for floating windows
      },

      -- Set sidebar background to dark
      sidebars = { "qf", "help", "vista_kind", "terminal", "packer" },

      -- Adjusts the brightness of the colors of the **Day** style
      day_brightness = 0.3,

      -- Enabling this will hide inactive statuslines and replace them with a thin border
      hide_inactive_statusline = false,

      -- Configure which style to use for different highlight groups
      dim_inactive = false,
      lualine_bold = false,
    },
  },

  -- Configure LazyVim to use Tokyo Night
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
