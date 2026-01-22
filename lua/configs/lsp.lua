require("nvchad.configs.lspconfig").defaults()

-- vim.lsp.enable('sqlls')

local capabilities = require('blink.cmp').get_lsp_capabilities()
-- local lspconfig = require('lspconfig')

local servers = {
  'lua_ls',
  'pyright',
}

for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    capabilities = capabilities
  })
  vim.lsp.enable(lsp)
end

-- vim.lsp.config('lua_ls', {
--   capabilities = capabilities
-- })
--
-- vim.lsp.config('pyright', {
--   capabilities = capabilities,
-- })
--
-- vim.lsp.enable('pyright')
