return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    local colors = {
      blue = "#A3A9CE",
      cyan = "#89B3B6",
      black = "#292522",
      white = "#C1A78E",
      red = "#D47766",
      violet = "#CF9BC2",
      grey = "#34302C",
    }

    local bubbles_theme = {
      normal = {
        a = { fg = colors.black, bg = colors.violet },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.white, bg = colors.black },
      },
      insert = {
        a = { fg = colors.black, bg = colors.blue },
      },
      visual = {
        a = { fg = colors.black, bg = colors.cyan },
      },
      replace = {
        a = { fg = colors.black, bg = colors.red },
      },
      inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.black, bg = colors.black },
      },
    }

    return {
      options = {
        theme = bubbles_theme,
        component_separators = { left = "", right = "|" },
        section_separators = { left = "◥", right = "◣" },
        disabled_filetypes = {},
      },
      sections = {
        lualine_a = {
          { "mode", separator = { right = "◣" }, right_padding = 2 },
        },
        lualine_b = {
          {
            "filename",
            separator = { left = "◥", right = "◣" },
            right_padding = 1,
          },
          {
            "branch",
            separator = { right = "◣" },
            right_padding = 1,
          },
          {
            "diff",
            separator = { right = "◣" },
            right_padding = 1,
          },
          {
            "diagnostics",
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
            separator = { right = "◣" },
            right_padding = 1,
          },
        },
        lualine_c = {}, -- keep middle pure black
        lualine_x = {},
        lualine_y = {
          { "filetype", separator = { left = "◥", right = "◣" } },
          { "progress", separator = { left = "◥", right = "" } },
        },
        lualine_z = {
          {
            "location",
            color = { fg = colors.black, bg = colors.red },
            separator = { left = "◥", right = "" },
            left_padding = 2,
            right_padding = 0,
          },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = {},
    }
  end,
  config = function(_, opts)
    require("lualine").setup(opts)

    -- Force white separators globally (optional tweak)
    vim.cmd([[
      hi LualineSeparator guifg=#C1A78E
    ]])
  end,
}
