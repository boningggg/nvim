local ok_dapui, dapui = pcall(require, "dapui")

if not ok_dapui then
  vim.notify("[ERROR] Don't find the plugin 'nvim-dap-ui', please check 'plugins.lua'.")
  return
end

dapui.setup()

-- Use nvim-dap events to open and close the windows automatically
local dap = require("dap")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
