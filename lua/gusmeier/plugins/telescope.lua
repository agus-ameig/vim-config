local function config_telescope()
  local builtin = require("telescope.builtin")
  local find_files_hidden = function ()
    return builtin.find_files({hidden = true})
  end
  vim.keymap.set("n", "<leader>phf", find_files_hidden, { desc = "Find hidden files" })
  vim.keymap.set("n", "<leader>pg", builtin.git_files, { desc = "Find git files" })
  vim.keymap.set("n", "<leader>pf", builtin.live_grep,{ desc = "Find in files"})
  vim.keymap.set("n", "<leader>pk", builtin.keymaps, { desc = "Find keymaps"})
  vim.keymap.set("n", "<leader>pb", builtin.buffers, { desc = "Find buffers"})
  vim.keymap.set("n", "<leader>pr", builtin.oldfiles, { desc = "Find oldfiles"})
  vim.keymap.set("n", "<leader>ph", builtin.help_tags, { desc = "Find help tags"})
  vim.keymap.set("n", "<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("Grep> ")})
  end)
end

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.4",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = config_telescope
}
