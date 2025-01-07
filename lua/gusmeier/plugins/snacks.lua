return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		bigfile = { enabled = true },
		dashboard = {
			sections = {
				{
					section = "terminal",
					cmd = "chafa ~/.config/nvim/corvo.png --format symbols --symbols vhalf --size 60x60; sleep .1",
					height = 30,
					padding = 1,
				},
				{
					pane = 2,
          { icon="󰌌 ", title="Keymaps", padding = {1, 0}},
					{ section = "keys", gap = 1, indent = 2},
          { icon="󰉋 ", title="Projects", padding = {1, 2}},
          { section = "projects", gap = 1, indent = 2},
					{ section = "startup", padding = {0, 1}},
				},
			},
		},
		indent = { enabled = true },
		input = { enabled = true },
		notifier = {
			enabled = true,
			timeout = 20000,
		},
		quickfile = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
	},
	keys = {
		-- Notifications
		{
			"<leader>n",
			function()
				Snacks.notifier.show_history()
			end,
			desc = "Show notification history",
		},
		-- Git
		{
			"<leader>gb",
			function()
				Snacks.git.blame_line()
			end,
			desc = "Git blame line",
		},
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>gB",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Git browse",
		},
		{
			"<leader>gf",
			function()
				Snacks.lazygit.log_file()
			end,
			desc = "Lazygit current file history",
		},
		{
			"<leader>gl",
			function()
				Snacks.lazygit.log()
			end,
			desc = "Lazygit log (CWD)",
		},
		{
			"<c-/>",
			function()
				Snacks.terminal()
			end,
			desc = "Toggle terminal",
		},
	},
}
