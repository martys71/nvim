local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local mason_registry = require "mason-registry"
local codelldb = mason_registry.get_package "codelldb"
local extension_path = codelldb:get_install_path() .. "/extension/"
local codelldb_command = extension_path .. "adapter/codelldb"
-- local liblldb_path = extension_path .. "lldb/lib/liblldb.lib"
local codelldb_port = "${port}"

-- local lldb_command = "lldb"
vim.g.rustaceanvim = {
  dap = {
    -- adapter = require("rustaceanvim.config").get_codelldb_adapter(codelldb_path, liblldb_path)
    adapter = {
      type = "server",
      port = codelldb_port,
      host = "127.0.0.1",
      executable = {
        command = codelldb_command,
        args = {
          "--port",
          codelldb_port,
        },
      },
    },
  },
  server = {
    on_attach = function(_, _)
      vim.keymap.set("n", "<leader>k", ":RustLsp hover actions<CR>")
      vim.keymap.set("n", "<leader>a", ":RustLsp codeAction<CR>")
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
    end,
    capabilities = capabilities,
  },
  tools = {
    float_win_config = {
      auto_focus = true,
    },
  },
}
