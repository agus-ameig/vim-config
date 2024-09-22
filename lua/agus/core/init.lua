require("agus.core.set")
require("agus.core.remap")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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


if vim.fn.has('wsl') == 1 then
  vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 0
  }
end
