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

map("n", "<leader>db", ":DapToggleBreakpoint<CR>")
map("n", "<leader>dx", ":DapTerminate<CR>")
map("n", "<leader>do", ":DapStepOver<CR>")
map("n", "<leader>di", ":DapStepInto<CR>")
map("n", "<leader>dq", ":DapStepOut<CR>")
map("n", "<leader>dc", ":DapContinue<CR>")

vim.g.dap_virtual_text = true
