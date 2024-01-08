return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({})
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "ansiblels",
                    "bashls",
                    "gopls",
                    "htmx",
                    "lua_ls",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            lspconfig.ansiblels.setup({
                capabilities = capabilities
            })
            lspconfig.bashls.setup({
                capabilities = capabilities
            })
            lspconfig.gopls.setup({
                capabilities = capabilities,
                cmd = { "gopls" },
                filetypes = { "go", "gomod" },
                settings = {
                    gopls = {
                        analyses = {
                            unusedparams = true,
                        },
                        staticcheck = true,
                        gofumpt = true,
                        completeUnimported = true,
                        usePlaceholders = true,
                    },
                },
            })
            lspconfig.htmx.setup({
                capabilities = capabilities
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })
            vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gb", "<C-o>", {})
            vim.keymap.set("n", "<leader>gf", "<C-i>", {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}
