return {{"nvim-neotest/nvim-nio"}, {
    "mfussenegger/nvim-dap",
    dependencies = {"rcarriga/nvim-dap-ui", "williamboman/mason.nvim", "jay-babu/mason-nvim-dap.nvim"},
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        -- Set up debugging adapters
        require("mason-nvim-dap").setup({
            -- Enable the following debuggers
            ensure_installed = {"js-debug-adapter" -- For JavaScript/TypeScript
            },
            automatic_installation = true
        })

        -- Configure debuggers
        dap.adapters["pwa-node"] = {
            type = "server",
            host = "localhost",
            port = "${port}",
            executable = {
                command = "node",
                args = {require("mason-registry").get_package("js-debug-adapter"):get_install_path() ..
                    "/js-debug/src/dapDebugServer.js", "${port}"}
            }
        }

        -- Configure the UI
        dapui.setup()

        -- Automatically open UI when debugging starts
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
    end
}}
