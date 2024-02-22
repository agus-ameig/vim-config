require("agus.core.set")
require("agus.core.remap")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local gusmeier_group = augroup("GusmeierGroup", {})
local yank_group = augroup("HighlightYank", {})

autocmd({"TextYankPost"}, {
  group = yank_group,
  pattern = "*",
  callback = function ()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 40
    })
  end
})

autocmd({ "BufWritePre" }, {
	group = gusmeier_group,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})
