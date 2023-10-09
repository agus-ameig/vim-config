local function config_telescope() 
  local builtin = require("telescope.builtin")
  local find_files_hidden = function ()
    return builtin.find_files({hidden = true})
  end
  vim.keymap.set("n", "<leader>pf", find_files_hidden, {})
  vim.keymap.set("n", "<C-p>", builtin.git_files, {})
  vim.keymap.set("n", "<leader>pg", builtin.live_grep,{})
  vim.keymap.set("n", "<leader>pb", builtin.buffers, {})
  vim.keymap.set("n", "<leader>pr", builtin.oldfiles, {})
  vim.keymap.set("n", "<leader>ph", builtin.help_tags, {})
  vim.keymap.set("n", "<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("Grep> ")})
  end)
end

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.1",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = config_telescope
}
