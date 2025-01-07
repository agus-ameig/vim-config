local function config_copilot()
  require("copilot").setup({
    suggestion = { enabled = false },
    panel = { enabled = false },
    filetypes = {
      html = false,
    },
  })
  require("copilot_cmp").setup()
end

return {
  config_copilot = config_copilot
}
