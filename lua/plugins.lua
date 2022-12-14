local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

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

return require('packer').startup(function(use)
  use {
	'xolox/vim-notes',
	requires = {
		'xolox/vim-misc'
	}
  }
  use 'wbthomason/packer.nvim'
  use 'windwp/windline.nvim'
  use "EdenEast/nightfox.nvim"
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'mfussenegger/nvim-lint'
  use 'nvim-treesitter/nvim-treesitter'
  use "lukas-reineke/lsp-format.nvim"
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'google/vim-maktaba'
  use 'google/vim-glaive'
  use 'google/vim-codefmt'
  use 'mfussenegger/nvim-dap'
  use 'onsails/lspkind.nvim'
  use 'folke/which-key.nvim'
  use 'simrat39/rust-tools.nvim'
use 'nvim-lua/plenary.nvim'
use 'mfussenegger/nvim-dap'
use {
  "folke/todo-comments.nvim",
  requires = "nvim-lua/plenary.nvim",
  config = function()
    require("todo-comments").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}
  use {
	  'jose-elias-alvarez/null-ls.nvim',
	  config = function()
	      require("null-ls").setup({
	        sources = {
		  require("null-ls").builtins.formatting.stylua,
		  require("null-ls").builtins.diagnostics.eslint,
		  require("null-ls").builtins.completion.spell,
		  require("null-ls").builtins.diagnostics.golangci_lint,
		  require("null-ls").builtins.formatting.goimports_reviser,
		  require("null-ls").builtins.formatting.golines,
		  require("null-ls").builtins.code_actions.gitsigns,
		  require("null-ls").builtins.code_actions.shellcheck,
		  require("null-ls").builtins.diagnostics.checkmake,
	        },
	     })
	  end,
   requires = {
    'nvim-lua/plenary.nvim'
   }
  }
  use 'f-person/git-blame.nvim'
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
  use {
    'karb94/neoscroll.nvim',
     config = function()
	     require("neoscroll").setup()
     end,
  }
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
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  use {'shaunsingh/oxocarbon.nvim', run = './install.sh'}
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      local saga = require("lspsaga")
      saga.init_lsp_saga()
    end,
  })
  use 'leoluz/nvim-dap-go'
  use {
  'kyazdani42/nvim-tree.lua',
   requires = {
    'kyazdani42/nvim-web-devicons', -- optional, for file icons
   },
   tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  use({
    'noib3/nvim-cokeline',
    requires = 'kyazdani42/nvim-web-devicons', -- If you want devicons
    config = function()
      require('cokeline').setup()
    end
  })
end)
