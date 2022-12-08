local fn = vim.fn

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "github/copilot.vim" -- copilot
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  use({
    'glepnir/galaxyline.nvim',
    -- some optional icons
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  })
  use "gen740/SmoothCursor.nvim"
  require("smoothcursor").setup{}
  use { 
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  require("Comment").setup{}
  use "lukas-reineke/indent-blankline.nvim"

  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "dracula/vim"
  use "sainnhe/sonokai"
  use "catppuccin/nvim"
    use {
       "mcchrish/zenbones.nvim",
       -- Optionally install Lush. Allows for more configuration or extending the colorscheme
       -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
       -- In Vim, compat mode is turned on as Lush only works in Neovim.
       requires = "rktjmp/lush.nvim"
    }    
  use "ellisonleao/gruvbox.nvim"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use({ "neovim/nvim-lspconfig" }) -- enable LSP
  use({ "williamboman/nvim-lsp-installer" }) -- simple to use language server installer
  use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters
  use 'mfussenegger/nvim-jdtls'
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  use({ 'j-hui/fidget.nvim' }) -- tells you when lsp finishes loading
  require("fidget").setup{}
  
  -- Telescope
  use "nvim-telescope/telescope.nvim"
  require("telescope").setup{ 
    defaults = { 
      file_ignore_patterns = {
        "vendor"
      }
    } 
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- Git
  use "lewis6991/gitsigns.nvim"
  -- use "airblade/vim-gitugtter"

  -- harpoon 
  use 'ThePrimeagen/harpoon'
  require("harpoon").setup()

  -- headers for statements such as functions/if/for/etc. 
  use 'nvim-treesitter/nvim-treesitter-context'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
