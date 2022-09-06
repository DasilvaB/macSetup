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
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "numToStr/Comment.nvim" -- Easily comment stuff
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
  -- use "fatih/vim-go" -- Great golang features such as :GoDocs -- NOTE: this doesn't work well with LSP 

  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "dracula/vim"
  use "sainnhe/sonokai"

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
  use "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
  
  -- Telescope
  use "nvim-telescope/telescope.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Git
  use "lewis6991/gitsigns.nvim"
  -- use "airblade/vim-gitugtter"

  -- harpoon 
  use 'ThePrimeagen/harpoon'

  -- headers for statements such as functions/if/for/etc. 
  use 'nvim-treesitter/nvim-treesitter-context'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
