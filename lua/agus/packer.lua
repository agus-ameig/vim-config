vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Colorscheme
  use({
    "catppuccin/nvim",
    as = "catppuccin"
  })
  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- Treesitter
  use({ 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } })
  use 'nvim-treesitter/playground'
  -- LSP
  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v1.x',
      requires = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' }, -- Required
        { 'williamboman/mason.nvim' }, -- Optional
        { 'williamboman/mason-lspconfig.nvim' }, -- Optional

        -- Autocompletiont
        { 'hrsh7th/nvim-cmp' }, -- Required
        { 'hrsh7th/cmp-nvim-lsp' }, -- Required
        { 'hrsh7th/cmp-buffer' }, -- Optional
        { 'hrsh7th/cmp-path' }, -- Optional
        { 'saadparwaiz1/cmp_luasnip' }, -- Optional
        { 'hrsh7th/cmp-nvim-lua' }, -- Optional

        -- Snippets
        { 'L3MON4D3/LuaSnip' }, -- Required
        { 'rafamadriz/friendly-snippets' }, -- Optional
      }
    }
    -- Harpoon
    use 'theprimeagen/harpoon'

    -- Other Plugins
    use 'mbbill/undotree'
    use 'tpope/vim-fugitive'
    use("eandrju/cellular-automaton.nvim")
    use "lewis6991/gitsigns.nvim"
    use 'nvim-lualine/lualine.nvim' -- Fancier statusline
    use {
        "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
    }
    use"onsails/lspkind.nvim"
    use { "zbirenbaum/copilot.lua" }
    use"zbirenbaum/copilot-cmp"
    use {
      "SmiteshP/nvim-navic",
      requires = "neovim/nvim-lspconfig"
    }
    use { "kyazdani42/nvim-web-devicons" }
    use 'arkav/lualine-lsp-progress'
    use 'mfussenegger/nvim-lint'
    use { 'mhartington/formatter.nvim' }
end)

