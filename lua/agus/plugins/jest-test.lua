return {
	"jest-test",
	dir = "~/Documents/personal/jest-test.nvim/",
	config = function()
		local t = require("jest-test")
		vim.print(t, vim.o.lines)
		vim.keymap.set("n", "<leader>tt", t.test)
		vim.keymap.set("n", "<leader>tr", function()
      require("lazy.core.loader").reload("jest-test.nvim")
		end)
		vim.keymap.set("n", "<leader>th", function()
			vim.print(vim.o.lines)
		end)
	end,
}
