require("dapui").setup()

local map = vim.keymap.set
local dap = require("dap")
local dapui = require("dapui")

local dap = require('dap')

-- Konfigruracja adaptera codelldb
local codelldb = false
local codelldb_command = "codelldb"
local mason_registry = require "mason-registry"
if mason_registry.is_installed("codelldb") then
  local codelldb = mason_registry.get_package("codelldb")
  local codelldb_path = codelldb:get_install_path() .. "/extension/adapter/"
  codelldb_command = codelldb_path .. codelldb_command
  codelldb = true
elseif vim.fn.executable(codelldb_command) then
  codelldb = true
end

if codelldb then
  dap.adapters.codelldb = {
    type = "executable",
    command = codelldb_command,
    detached = false,
  }
end

-- Konfigruracja adaptera lldb-dap
local lldbdap = false
local lldbdap_command = "lldb-dap"
if vim.fn.executable(lldbdap_command) then
  lldbdap_command = vim.fn.exepath(lldbdap_command)
  lldbdap = true
end

if lldbdap then
  dap.adapters.lldb = {
    type = "executable",
    command = lldbdap_command,
    name = "lldb",
  }
end

-- Konfiguracja jezykow c/c++/rust
if codelldb then
  dap.configurations.cpp = {
    {
      name = "Launch file",
      type = "codelldb",
      request = "launch",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
    },
  }
  dap.configurations.c = dap.configurations.cpp
  dap.configurations.rust = dap.configurations.cpp

elseif lldbdap then
  dap.configurations.cpp = {
    {
      name = "Launch",
      type = "lldb",
      request = "launch",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
      args = {},
      initCommands = "",
    },
  }
  dap.configurations.c = dap.configurations.cpp
  dap.configurations.rust = dap.configurations.cpp
end

-- Skroty klawiszowe do dapui
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open();
end

dap.listeners.after.event_terminated["dapui_config"] = function()
  dapui.close();
end

dap.listeners.after.event_exited["dapui_config"] = function()
  dapui.close();
end

map("n", "<leader>db", ":DapToggleBreakpoint<CR>")
map("n", "<leader>dx", ":DapTerminate<CR>")
map("n", "<leader>do", ":DapStepOver<CR>")
map("n", "<leader>di", ":DapStepInto<CR>")
map("n", "<leader>dq", ":DapStepOut<CR>")
map("n", "<leader>dc", ":DapContinue<CR>")

vim.g.dap_virtual_text = true
