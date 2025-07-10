return {
    "okuuva/auto-save.nvim",
    version = "*", -- Use latest tagged release
    cmd = "ASToggle", -- Allow manual toggle
    event = {"InsertLeave", "TextChanged", "VeryLazy"}, -- Ensure it's loaded properly
    opts = {
        enabled = true,
        trigger_events = {
            immediate_save = {"BufLeave", "FocusLost", "QuitPre", "VimSuspend"},
            defer_save = {"InsertLeave", "TextChanged"},
            cancel_deferred_save = {"InsertEnter"}
        },
        condition = function(buf) -- Ensure only normal buffers are saved
            return vim.bo[buf].buftype == ""
        end,
        write_all_buffers = false,
        noautocmd = false,
        lockmarks = false,
        debounce_delay = 1000,
        debug = false
    }
}
