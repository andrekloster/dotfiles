return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = {
                "bash",
                "go",
                "lua",
                "puppet",
                "python",
                "yaml",
                "css",
                "dockerfile",
                "html",
                "javascript",
                "json",
                "markdown",
                "php",
                "sql",
                "toml",
                "typescript",
                "vim",
                "vimdoc",
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
