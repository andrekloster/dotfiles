vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")
vim.g.mapleader = " "
vim.o.hlsearch = false
vim.o.mouse = "a"
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.completeopt = "menuone,noselect"
vim.o.termguicolors = true

-- CTRL+c im visual mode kopiert in das OS clipboard
vim.api.nvim_set_keymap("v", "<C-c>", '"+y', { noremap = true, silent = true })
-- visual highlight yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
})

-- set js filetype for *.icinga2 files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.icinga2",
    command = "set filetype=javascript",
})
-- set ruby filetype for *.epp files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.epp",
    command = "set filetype=eruby",
})
-- set ruby filetype for *.eyaml files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.eyaml",
    command = "set filetype=yaml",
})
