--[[ Plugins ]]--
-- Packer as Plugin manager
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])
 
if not packer_exists then
  print("> Missing 'packer.nvim'")
  local directory = string.format(
    '%s/site/pack/packer/opt/',
    vim.fn.stdpath('data')
  )

  vim.fn.mkdir(directory, 'p')

  local out = vim.fn.system(string.format(
    'git clone %s %s',
    'https://github.com/wbthomason/packer.nvim',
    directory .. 'packer.nvim'
  ))
  print(out)
  print("Downloading packer ... ")
  print(" *** RESTART REQUIRED *** ")
  return
end

-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Let packer manage itself
  use { 'wbthomason/packer.nvim', opt = true }

  -- Colorscheme
  use { 'dracula/vim', as = 'dracula' }

  -- LSP config
  use { 'neovim/nvim-lspconfig' }

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Completion
  use { 'nvim-lua/completion-nvim' }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- Git support
  use { 'tpope/vim-fugitive' }
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup()
    end
  }

  -- Handy for chaning surrounding
  use { 'tpope/vim-surround' }

  -- Statusline
  -- use {
  --   'hoob3rt/lualine.nvim',
  --   requires = {'kyazdani42/nvim-web-devicons', opt = true}
  -- }
end)

