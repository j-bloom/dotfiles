-- Only required if you have packer configured as `opt`
--vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  
  --Colorschemes
  use 'gruvbox-community/gruvbox'
  use 'folke/tokyonight.nvim' 

  --LSP stuff
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'onsails/lspkind.nvim'
  use 'OmniSharp/omnisharp-vim' 


  -- Formatting
  use 'jose-elias-alvarez/null-ls.nvim' -- Allows me to Autoformat
  use({"ckipp01/stylua-nvim", run = "cargo install stylua"})

  -- Autopairs 
  use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  --Snippets 
  use 'rafamadriz/friendly-snippets' 

  --Status bar
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }   

  --Nvim-tree
  use {
    'kyazdani42/nvim-tree.lua',
--    requires = {
--      'kyazdani42/nvim-web-devicons', -- optional, for file icons
--    },
--    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  --Treesitter
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'windwp/nvim-ts-autotag'

  --Telescope
  use {
      'nvim-telescope/telescope.nvim',-- tag = '0.1.0',
      -- or                          , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Magit for Neovim
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

end)
