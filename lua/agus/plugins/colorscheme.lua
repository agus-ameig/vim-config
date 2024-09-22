local function color_my_pencils(color)
	color = color or 'catppuccin'
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
  vim.api.nvim_set_hl(0, "NormalNC", {bg = "none"})
  vim.api.nvim_set_hl(0, "NeoTreeNormal", {bg = "none"})
  vim.api.nvim_set_hl(0, "NeoTreeNormalNC", {bg = "none"})
	vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
end

return {
 "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    color_my_pencils("catppuccin")
	end
}

