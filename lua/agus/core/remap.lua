vim.g.mapleader = " "

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- replace line
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>P", [["+p]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f","<cmd>FormatWriteLock<CR>")

--for changing a word inside a single file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
--for changing a word inside whole project
vim.keymap.set("n", "<leader>sa", [[:cdo s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")

vim.keymap.set("n", "<leader>ng", function()
  local file = vim.fn.expand('%:t')
  local ext = vim.fn.expand('%:e')
  local base = file:sub(1, #file - #ext - 1)

  local extensions = {'.ts', '.html', '.scss'}
  local current_index = vim.fn.index(extensions, '.'...ext)
  local next_ext = extensions[current_index % #extensions + 1]

  local next_file = base..next_ext
  vim.cmd('edit '.. next_file)
end, {norempa = true, silent = true})


