-- Utility functions
local M = {}

-- Check if a command is available
M.has_command = function(cmd)
  return vim.fn.executable(cmd) == 1
end

-- Check if ripgrep is installed
M.has_ripgrep = function()
  return M.has_command("rg")
end

return M

