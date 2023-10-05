require("agus.set")
require("agus.remap")
require("agus.packer")
require("agus.jestrunner")

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- local lsp_fmt_group = vim.api.nvim_create_augroup('LspFormattingGroup', {})
-- -- vim.api.nvim_create_autocmd({"BufWritePost"}, {
--   group = lsp_fmt_group,
--   callback = function (ev)
--     local efm = vim.lsp.get_active_clients({name = 'efm', bufnr = ev.buf })
--     if vim.tbl_isempty(efm) then
--       return
--     end
--
--     vim.lsp.buf.format({ name = 'efm' })
--   end,
-- })
