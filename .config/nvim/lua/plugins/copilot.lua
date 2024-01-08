return {
    {
        "github/copilot.vim",
    },
    {
        "gptlang/CopilotChat.nvim",
        config = function()
            vim.opt.termguicolors = true
            require("bufferline").setup({})
        end
    },
}
