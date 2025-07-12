return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = function(_, opts)
      opts.spec = opts.spec or {}
      opts.spec[#opts.spec + 1] = { "<leader>D", group = "Docker", icon = "" }
    end,
  },

  {
    "LazyVim/LazyVim",
    keys = {
      {
        "<leader>D",
        function()
          local Util = require("lazyvim.util")
          local function open_lazydocker()
            Util.terminal({ "lazydocker" }, {
              cwd = Util.root(),
              esc_esc = false,
              ctrl_hjkl = false,
              border = "double",
            })
          end

          -- Check if Docker daemon is running
          local handle = io.popen("docker info > /dev/null 2>&1 && echo RUNNING || echo STOPPED")
          if handle then
            local status = (handle:read("*a") or ""):gsub("%s+", "")
            handle:close()

            if status == "STOPPED" then
              vim.notify("Docker daemon not running. Trying to start it...", vim.log.levels.WARN)

              -- Modify this command for your OS if needed
              os.execute("open --background -a Docker") -- macOS

              -- Wait a bit then try opening lazydocker
              vim.defer_fn(open_lazydocker, 3000)
            else
              open_lazydocker()
            end
          else
            vim.notify("Failed to check Docker status", vim.log.levels.ERROR)
          end
        end,
        desc = "Lazydocker",
      },
    },
  },
}
