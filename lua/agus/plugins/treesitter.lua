local function configure_treesitter()
  require'nvim-treesitter.install'.compilers = {"clang", "gcc"}
  require'nvim-treesitter.configs'.setup {
    ensure_installed = { "vimdoc", "javascript", "typescript", "c", "lua", "vim" },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  }
end

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "VeryLazy",
  config = configure_treesitter
}
