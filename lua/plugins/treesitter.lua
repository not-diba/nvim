return {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
        -- Ensure the list exists before extending
        opts.ensure_installed = opts.ensure_installed or {}

        -- Add your parsers
        vim.list_extend(opts.ensure_installed,
            {"dart", "bash", "html", "javascript", "json", "lua", "markdown", "markdown_inline", "python", "query",
             "regex", "tsx", "typescript", "vim", "yaml"})
    end
}

