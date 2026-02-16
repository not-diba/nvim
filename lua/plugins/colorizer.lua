return {
  "catgoose/nvim-colorizer.lua",
  event = "BufReadPre",
  opts = {
    user_default_options = {
      tailwind = true,
      css = false,
      css_fn = false,
      mode = "foreground",
      sass = { enable = false },
    },
    filetypes = {
      "astro",
      "typescript",
      "typescriptreact",
      "javascript",
      "javascriptreact",
      "css",
      "html",
      "dart",
      "go",
      "java",
      "ruby",
    },
  },
}
