-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  
  -- Code Complition
  use('neovim/nvim-lspconfig')
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/vim-vsnip")
  use("tzachar/cmp-tabnine", { run = "./install.sh" })
  use("onsails/lspkind.nvim")

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use("folke/tokyonight.nvim")
  use("preservim/nerdtree")
  use("fatih/vim-go")
  use("tpope/vim-fugitive")

end)
