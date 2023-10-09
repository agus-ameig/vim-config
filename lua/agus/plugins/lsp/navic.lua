local function config_navic()
  vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
  --require'nvim-navic'.setup()
  vim.diagnostic.config({
    virtual_text = true,
  })
end
return {
  config_navic = config_navic
}
