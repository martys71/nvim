require("nvchad.configs.lspconfig").defaults()

local servers = { "sqlls" }

vim.lsp.config('sqlls', {})

vim.lsp.enable(servers)

