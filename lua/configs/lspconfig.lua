require("nvchad.configs.lspconfig").defaults()

-- vim.lsp.enable('sqlls')

local capabilities = require('blink.cmp').get_lsp_capabilities()
local lspconfig = require('lspconfig')

lspconfig['lua_ls'].setup({ capabilities = capabilities })
