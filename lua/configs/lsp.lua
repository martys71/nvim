require("nvchad.configs.lspconfig").defaults()

-- local nvlsp = require "nvchad.configs.lspconfig"
-- vim.lsp.enable('sqlls')

local capabilities = require('blink.cmp').get_lsp_capabilities()
-- local lspconfig = require('lspconfig')

local servers = {
  'html',
  'lua_ls',
  'pyright',
}

for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    capabilities = capabilities
  })
  vim.lsp.enable(lsp)
end

vim.lsp.config('vue_ls', {
  init_options = {
    vue = {
      hybridMode = true,
    },
  },
  -- on_attach = nvlsp.on_attach,
  capabilities = capabilities,
  filetypes = { "vue" },
})

vim.lsp.enable('vue_ls')

vim.lsp.config('ts_ls', {
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vim.fn.stdpath "data" ..
            "/mason/packages/vue-language-server/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin",
        languages = { "vue" },
      },
    },
  },
  filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "vue" },
  -- on_attach = nvlsp.on_attach,
  capabilities = capabilities,
})

vim.lsp.enable('ts_ls')

-- vim.lsp.config('lua_ls', {
--   capabilities = capabilities
-- })
--
-- vim.lsp.config('pyright', {
--   capabilities = capabilities,
-- })
--
-- vim.lsp.enable('pyright')
