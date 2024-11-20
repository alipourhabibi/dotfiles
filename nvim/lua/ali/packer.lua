-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use('wbthomason/packer.nvim')

  use('simrat39/rust-tools.nvim')

  -- Code Complition
  use('neovim/nvim-lspconfig')
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/nvim-cmp")
  use("onsails/lspkind.nvim")
  use('hrsh7th/cmp-nvim-lua')
  use('hrsh7th/cmp-nvim-lsp-signature-help')
  use('hrsh7th/cmp-vsnip')
  use('hrsh7th/cmp-path')
  use('hrsh7th/vim-vsnip')

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use("folke/tokyonight.nvim")
  use("preservim/nerdtree")
  use("fatih/vim-go")
  use("tpope/vim-fugitive")

  use('williamboman/mason.nvim')
  use('williamboman/mason-lspconfig.nvim')

  use('mfussenegger/nvim-dap')
  use('leoluz/nvim-dap-go')
  use('nvim-neotest/nvim-nio')
  use('rcarriga/nvim-dap-ui')

  use('kyazdani42/nvim-web-devicons')

  use({
  "epwalsh/obsidian.nvim",
  tag = "*",  -- recommended, use latest release instead of latest commit
    requires = {
      -- Required.
      "nvim-lua/plenary.nvim",
    },
  })

  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

  vim.opt.conceallevel = 1

end)
