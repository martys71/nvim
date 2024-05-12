require("dapui").setup()

local map = vim.keymap.set
local dap = require("dap")
local dapui = require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open();
end

dap.listeners.after.event_terminated["dapui_config"] = function()
  dapui.close();
end

dap.listeners.after.event_exited["dapui_config"] = function()
  dapui.close();
end

map("n", "<leader>dt", ":DapToggleBreakpoint<CR>")
map("n", "<leader>dx", ":DapTerminate<CR>")
map("n", "<leader>do", ":DapStepOver<CR>")
map("n", "<leader>dus", function()
  local widgets = require "dap.ui.widgets"
  local sidebar = widgets.sidebar(widgets.scopes)
  sidebar.toggle()
  -- require ("dapui").toggle()
end, { desc = "Open debugging sidebar" })

vim.g.dap_virtual_text = true
