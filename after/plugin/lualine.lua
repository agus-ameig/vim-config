local config = {
  options = {
    icons_enabled = true,
    theme = 'rose-pine',
    component_separators = '',
    section_separators= {left = '', right = ''},
  },
  sections = {
      lualine_a = {{'mode', icon=""}},
      lualine_b = {{'filetype', icon_only = true, padding = {left = 2, right = 1} } , {'filename', path = 4, padding = {left = 0, right = 2} }},
      lualine_c = {{'diff', symbols = {added = " ",modified = " ", removed = " " } }},
      lualine_x = {'diagnostics','branch', 'fileformat', 'encoding'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
}
require'lualine'.setup(config)
