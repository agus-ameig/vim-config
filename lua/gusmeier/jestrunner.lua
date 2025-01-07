local function create_window()
  vim.cmd("botright vnew")
end

local function focus_last_accessed_window()
  vim.cmd("wincmd p")
end


local function get_filename()
  return vim.fn.expand('%')
end


local function run_file()
  local file = get_filename():gsub("\\","/") 
  local cmd = 'node "node_modules/jest/bin/jest.js" "'..file..'" --watch'
  create_window()
  vim.api.nvim_command('terminal ' .. cmd )
  focus_last_accessed_window()
end

local function run_single()
  local file = get_filename():gsub("\\","/")
  local line = vim.api.nvim_get_current_line()
  local _, _, test_name = string.find(line, "^%s*%a+%(['\"](.+)['\"]")
  local cmd = 'node "node_modules/jest/bin/jest.js" "'..file..'" -t="' ..test_name..'" --watch'
  create_window()
  vim.api.nvim_command('terminal ' .. cmd )
  focus_last_accessed_window()
end

vim.keymap.set("n", "<leader>jrf", run_file)
vim.keymap.set("n", "<leader>jrt", run_single)
