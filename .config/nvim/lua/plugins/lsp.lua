return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				ansiblels = {},
				docker_compose_language_service = {},
				dockerls = {},
				helm_ls = {},
				ruff_lsp = {
					handlers = {
						["textDocument/publishDiagnostics"] = function() end,
					},
				},
			},
		},
	},
}
