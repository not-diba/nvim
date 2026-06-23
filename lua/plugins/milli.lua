return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  dependencies = { "amansingh-afk/milli.nvim" },
  config = function()
    local ascii_images = {
      "cactus",
      "blackhole",
      "badge",
      "chrome",
      "finger",
      "flyingdragon",
      "lighningtornado",
      "robot",
      "shadertwo",
      "spinner",
    }
    math.randomseed(os.time())
    local chosen = ascii_images[math.random(#ascii_images)]
    local splash = require("milli").load({ splash = chosen, loop = true })

    require("snacks").setup({
      dashboard = {
        enabled = true,
        preset = {
          header = table.concat(splash.frames[1], "\n"),
        },
        sections = {
          { section = "header", padding = 1 },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
      },
    })

    require("milli").snacks({ splash = chosen, loop = true })
  end,
}
