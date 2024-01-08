return {
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            vim.opt.termguicolors = true
            require("bufferline").setup({
                options = {
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "NvimTree",
                            separator = true,
                        },
                    },
                },
            })
            vim.keymap.set("n", "<leader>[", ":bprevious<CR>")
            vim.keymap.set("n", "<leader>]", ":bnext<CR>")
        end,
    },
    {
        "famiu/bufdelete.nvim",
        config = function()
            vim.keymap.set("n", "<leader>bd", ":Bdelete<CR>", { silent = true })
        end,
    },
}
