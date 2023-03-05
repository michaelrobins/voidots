return require('packer').startup(function(use)
  -- general
  use 'wbthomason/packer.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-tree/nvim-web-devicons'
  use {
    'ibhagwan/fzf-lua',
    requires = { 'nvim-tree/nvim-web-devicons' },
  }
  use 'tamago324/lir.nvim'
  use 'tpope/vim-eunuch'
  use 'jiangmiao/auto-pairs'
  use 'numtostr/FTerm.nvim'
  use 'EdenEast/nightfox.nvim'
  use 'mhinz/vim-startify'
  use 'b0o/schemastore.nvim'
  use { 'akinsho/bufferline.nvim', tag = '*', requires = 'kyazdani42/nvim-web-devicons' }
  use { 'L3MON4D3/LuaSnip', requires = 'rafamadriz/friendly-snippets' }
  use {
    'kylechui/nvim-surround',
    config = function()
      require('nvim-surround').setup()
    end,
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }

  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'saadparwaiz1/cmp_luasnip'
  use 'onsails/lspkind.nvim'
  use { 'jose-elias-alvarez/null-ls.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- misc
  use 'windwp/nvim-ts-autotag'
  -- use 'p00f/nvim-ts-rainbow' not well maintained, causing issues
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  }
  use {
    'folke/twilight.nvim',
    config = function()
      require('twilight').setup()
    end,
  }
  use {
    'folke/zen-mode.nvim',
    config = function()
      require('zen-mode').setup()
    end,
  }
  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('trouble').setup()
    end,
  }
end)
