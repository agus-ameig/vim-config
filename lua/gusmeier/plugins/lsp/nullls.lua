return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"nvimtools/none-ls.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup()
		require("mason-null-ls").setup({
			ensure_installed = { "stylua" },
			automatic_installation = false,
			handlers = {},
		})
		vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
	end,
}
