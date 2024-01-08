return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({})
		-- open tree
		--vim.keymap.set('n', '<leader>t', ':NvimTreeOpen<CR>')
		vim.keymap.set("n", "<C-t>", ":NvimTreeOpen<CR>")
		-- close tree
		vim.keymap.set("n", "<leader>tc", ":NvimTreeClose<CR>")
		-- collapse tree
		vim.keymap.set("n", "<leader>tm", ":NvimTreeCollapse<CR>")
		-- find file in tree
		vim.keymap.set("n", "<leader>tf", ":NvimTreeFindFile<CR>")
		-- switch beween buffer and tree
		vim.keymap.set("n", "<leader>w", "<C-w>w")
		require("nvim-tree").setup({
			view = {
				width = 60,
			},
		})
	end,
}
