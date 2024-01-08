return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.formatting.gofumpt_reviser,
				null_ls.builtins.formatting.golines,
				null_ls.builtins.formatting.stylua,
			},
		})
		vim.keymap.set("n", "<leader>pf", vim.lsp.buf.format, {})
	end,
}
