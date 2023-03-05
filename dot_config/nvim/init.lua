if vim.g.vscode then
  vim.g.mapleader = ','
  -- vim.cmd [[ nnoremap <leader>w <Cmd>call VSCodeNotify('workbench.action.files.save')<CR> ]]
  vim.cmd [[ nnoremap <leader>q <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR> ]]
  vim.cmd [[ nnoremap <leader>f <Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR> ]]
else
  --                              _       _ __    __
  --   ____ ___ _      _______   (_)___  (_) /_  / /_  ______ _
  --  / __ `__ \ | /| / / ___/  / / __ \/ / __/ / / / / / __ `/
  -- / / / / / / |/ |/ / /     / / / / / / /__ / / /_/ / /_/ /
  --/_/ /_/ /_/|__/|__/_/     /_/_/ /_/_/\__(_)_/\__,_/\__,_/

  local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      lazypath,
    }
  end
  vim.opt.rtp:prepend(lazypath)

  vim.g.mapleader = ',' -- set `mapleader` before lazy

  require('lazy').setup {
    {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v1.x',
      dependencies = {
        { 'neovim/nvim-lspconfig' },
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },
        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'saadparwaiz1/cmp_luasnip' },
        { 'hrsh7th/cmp-nvim-lua' },
        { 'L3MON4D3/LuaSnip' },
        { 'rafamadriz/friendly-snippets' },
      },
    },
    {
      'EdenEast/nightfox.nvim',
      lazy = false,
      priority = 1000,
      config = function()
        vim.cmd 'colorscheme nordfox'
      end,
    },
    {
      'nvim-treesitter/nvim-treesitter',
      lazy = false,
      build = ':TSUpdate',
    },
    { 'ibhagwan/fzf-lua', dependencies = 'nvim-tree/nvim-web-devicons' },
    { 'jose-elias-alvarez/null-ls.nvim', dependencies = 'nvim-lua/plenary.nvim' },
    { 'ThePrimeagen/harpoon', dependencies = 'nvim-lua/plenary.nvim' },
    { 'nvim-lualine/lualine.nvim', dependencies = 'nvim-tree/nvim-web-devicons' },
    { 'folke/trouble.nvim', dependencies = 'nvim-tree/nvim-web-devicons' },
    { 'tamago324/lir.nvim', dependencies = 'nvim-lua/plenary.nvim' },
    { 'windwp/nvim-autopairs', config = true },
    { 'numToStr/Comment.nvim', config = true },
    { 'kylechui/nvim-surround', config = true },
    { 'b0o/SchemaStore' },
    { 'lukas-reineke/lsp-format.nvim' },
    { 'akinsho/toggleterm.nvim', version = '*', config = true },
    { 'David-Kunz/markid' },
    {
      'akinsho/bufferline.nvim',
      version = 'v3.*',
      dependencies = 'nvim-tree/nvim-web-devicons',
    },
    { 'numToStr/FTerm.nvim' },
  }

  require 'mwr.lsp-zero'
  require 'mwr.treesitter'
  require 'mwr.nulls'
  require 'mwr.fzf'
  require 'mwr.lualine'
  require 'mwr.luasnip'
  require 'mwr.lir'
  -- require 'mwr.tree'

  vim.opt.termguicolors = true
  vim.cmd [[set mouse=]]
  vim.opt.laststatus = 3
  vim.opt.wildmode = 'longest:full,full'
  vim.opt.number = true
  vim.opt.relativenumber = true
  vim.opt.hlsearch = false
  vim.opt.ignorecase = true
  vim.opt.smartcase = true
  vim.opt.showmode = false
  vim.opt.wrap = false
  vim.opt.signcolumn = 'yes'
  vim.opt.expandtab = true
  vim.opt.shiftwidth = 2
  vim.opt.softtabstop = 2
  vim.g.splitkeep = 'screen' -- prevents jank with splits
  vim.opt.splitbelow = true
  vim.opt.splitright = true
  vim.opt.scrolloff = 6
  vim.opt.swapfile = false
  vim.opt.backup = false
  vim.opt.undofile = true
  vim.o.ch = 0 -- remove empty command line space
  vim.cmd [[set shortmess+=c]]
  vim.cmd [[au FileType * set fo-=c fo-=r fo-=o]] --disable auto commment

  -- general maps
  vim.keymap.set('n', '<leader>w', ':w<CR>', { silent = true })
  vim.keymap.set('n', '<F3>', ':set hlsearch! hlsearch?<CR>', { silent = true })
  vim.keymap.set('n', '<F8>', ':Lazy sync<CR>', { silent = true })
  vim.keymap.set('n', '<leader>f', ':FzfLua files<CR>', { silent = true })
  vim.keymap.set('n', '<leader>e', ':TroubleToggle<CR>', { silent = true })
  vim.keymap.set('n', '<leader>q', ':bd<CR>', { silent = true })
  vim.keymap.set('n', '<C-P>', ':BufferLineCyclePrev<CR>', { silent = true })
  vim.keymap.set('n', '<C-N>', ':BufferLineCycleNext<CR>', { silent = true })
  vim.cmd [[map <C-h> <C-w>h]]
  vim.cmd [[map <C-l> <C-w>l]]
  vim.keymap.set('n', '<leader>d', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { silent = true })
  vim.keymap.set('n', '<leader>1', ':lua require("harpoon.mark").add_file()<CR>', { silent = true })
  vim.keymap.set('n', '<leader>g', ':lua require("lir.float").toggle()<CR>', { silent = true })

  -- gutter signs
  local signs = {
    Error = '',
    Warn = 'W',
    Hint = '󰌶',
    Info = '',
  }

  for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
  end
end

require('bufferline').setup {
  options = {
    buffer_close_icon = ' ',
    close_icon = ' ',
  },
}

require('FTerm').setup {
  border = 'single',
  dimensions = {
    height = 0.9,
    width = 0.9,
  },
}

-- Example keybindings
vim.keymap.set('n', '<leader>t', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<leader>t', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
