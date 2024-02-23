local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
	}
	vim.lsp.buf.execute_command(params)
end

local function config_lsp_config()
  require("lspconfig").tsserver.setup({
    commands = {
      OrganizeImports = {
        organize_imports,
        description = "Organize Imports",
      },
    },
  })
end

return {
  config_lsp_config = config_lsp_config
}
