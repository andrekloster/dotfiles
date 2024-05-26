-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- CTRL+c in visual mode copies to OS clipboard
vim.api.nvim_set_keymap("v", "<C-c>", '"+y', { noremap = true, silent = true })

-- Custom Schema for Kubernetes
vim.api.nvim_set_keymap("n", "kcs", ':lua require("user.schema").init()<CR>', { noremap = true, silent = true })
