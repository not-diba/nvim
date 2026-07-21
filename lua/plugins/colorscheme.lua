return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "melange",
    },
  },

  {
    "savq/melange-nvim",
    priority = 1000,
    opts = {
      styles = {
        types = "NONE",
        methods = "NONE",
        numbers = "NONE",
        strings = "NONE",
        comments = "italic",
        keywords = "italic",
        constants = "NONE",
        functions = "NONE",
        operators = "NONE",
        variables = "NONE",
        parameters = "NONE",
        conditionals = "italic",
        virtual_text = "NONE",
      },
      options = {
        bold = true,
        italic = true,
        underline = true,
      },
    },
  },
}
