return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        yamlls = {},
        helm_ls = {},
        ruff_lsp = {
          handlers = {
            ["textDocument/publishDiagnostics"] = function() end,
          },
        },
        dockerls = {},
        docker_compose_language_service = {},
      },
    },
  },
}
