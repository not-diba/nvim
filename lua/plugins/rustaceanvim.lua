return {
  "mrcjkb/rustaceanvim",
  -- To avoid being surprised by breaking changes,
  -- I recommend you set a version range
  version = "^9",
  -- This plugin implements proper lazy-loading (see :h lua-plugin-lazy).
  -- No need for lazy.nvim to lazy-load it.
  lazy = false,
  config = function()
    local cfg = require("rustaceanvim.config")
    local ok, mason_registry = pcall(require, "mason-registry")

    if ok and mason_registry.is_installed("codelldb") then
      local extension_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension"
      local codelldb_path = extension_path .. "/adapter/codelldb"
      local liblldb_path = extension_path .. "/lldb/lib/liblldb.dylib"
      local adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path)

      vim.g.rustaceanvim = {
        dap = { adapter = adapter },
      }

      local dap_ok, dap = pcall(require, "dap")
      if dap_ok then
        dap.configurations.rust = {
          {
            type = "codelldb",
            request = "launch",
            name = "Debug",
            program = function()
              vim.fn.system("cargo build")
              local cwd = vim.fn.getcwd()
              return cwd .. "/target/debug/" .. vim.fn.fnamemodify(cwd, ":t")
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
          },
        }
      end
    end
  end,
}
