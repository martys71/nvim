local codelldb_command = "codelldb"
local codelldb_port = "${port}"

local mason_registry = require "mason-registry"
if mason_registry.is_installed("codelldb") then
  local codelldb = mason_registry.get_package("codelldb")
  local codelldb_path = codelldb:get_install_path() .. "/extension/adapter/"
  codelldb_command = codelldb_path .. codelldb_command
end

local map = vim.keymap.set

vim.g.rustaceanvim = {
  -- dap = {
  --   adapter = {
  --     type = "server",
  --     port = codelldb_port,
  --     host = "127.0.0.1",
  --     executable = {
  --       command = codelldb_command,
  --       args = {
  --         "--port",
  --         codelldb_port,
  --       },
  --     },
  --   },
  -- },
  server = {
    on_attach = function(_, _)
      map("n", "<leader>k", ":RustLsp hover actions<CR>")
      map("n", "<leader>a", ":RustLsp codeAction<CR>")
    end,
  },
  tools = {
    float_win_config = {
      auto_focus = true,
    },
  },
}
