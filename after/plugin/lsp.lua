-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require("lsp-zero")
lsp.preset("recommended")

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
lsp.on_attach(function(client, bufnr)
	-- NOTE: Remember that lua is a real programming language, and as such it is possible
	-- to define small helper and utility functions so you don't have to repeat yourself
	-- many times.
	--
	-- In this case, we create a function that lets us more easily define mappings specific
	-- for LSP related items. It sets the mode, buffer and description for us each time.
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	nmap("[d", function()
		vim.diagnostic.goto_next()
	end)
	nmap("]d", function()
		vim.diagnostic.goto_prev()
	end)
	nmap("<leader>e", function()
		vim.diagnostic.open_float()
	end)

	nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

	nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
	nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
	nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
	nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
	nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
	-- See `:help K` for why this keymap
	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	nmap("<leader>K", vim.lsp.buf.signature_help, "Signature Documentation")

	-- Lesser used LSP functionality
	nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
	nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
	nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
	nmap("<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, "[W]orkspace [L]ist Folders")

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format()
	end, { desc = "Format current buffer with LSP" })

	-- Attach nvim-navic to the LSP buffer
	if client.server_capabilities.documentSymbolProvider then
		require("nvim-navic").attach(client, bufnr)
	end
end)

lsp.setup()
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
--require'nvim-navic'.setup()
vim.diagnostic.config({
	virtual_text = true,
})

require("copilot").setup({
	suggestion = { enabled = false },
	panel = { enabled = false },
	filetypes = {
		html = false,
	},
})
require("copilot_cmp").setup()

local cmp = require("cmp")
cmp.setup({
	sources = {
		{ name = "path", group_index = 1 },
		{ name = "copilot", group_index = 1 },
		{ name = "nvim_lsp", group_index = 1 },
		{ name = "buffer", keyword_length = 3 },
		{ name = "luasnip", keyword_length = 2 },
	},
	mapping = {
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		}),
	},
	formatting = {
		fields = { "menu", "abbr", "kind" },
		format = require("lspkind").cmp_format({
			maxwidth = 50,
			ellipsis_char = "...",
			before = function(entry, vim_item)
				local menu_icon = {
					nvim_lsp = "λ",
					luasnip = "⋗",
					buffer = "",
					path = "",
					nvim_lua = "",
				}
				vim_item.menu = menu_icon[entry.source.name]
				return vim_item
			end,
		}),
	},
})
local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf.execute_command(params)
end
require("lspconfig").tsserver.setup {
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports"
    }
  }
}
-- local languages = require("efmls-configs.defaults").languages()
-- local efmls_config = {
-- 	filetypes = vim.tbl_keys(languages),
-- 	settings = {
-- 		rootMarkers = { ".git/" },
-- 		languages = languages,
-- 	},
-- 	init_options = {
-- 		documentFormatting = true,
-- 		documentRangeFormatting = true,
-- 	},
-- }
-- require("lspconfig").efm.setup(vim.tbl_extend("force", efmls_config, {}))
