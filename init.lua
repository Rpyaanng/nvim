require("ryan")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		dependencies = { {'nvim-lua/plenary.nvim'} }
	},
    {'luisiacc/gruvbox-baby', branch = 'main', as = "gruvbox-baby"},
    {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'},
	'nvim-treesitter/playground',
    'theprimeagen/vim-with-me',
	'theprimeagen/harpoon',
	'mbbill/undotree',
	'tpope/vim-fugitive',
    'folke/zen-mode.nvim',
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{                                      -- Optional
			    'williamboman/mason.nvim',
    		    run = function()
				    pcall(vim.cmd, 'MasonUpdate')
			    end,
		    },
		    {'williamboman/mason-lspconfig.nvim'}, -- Optional

		    -- Autocompletion
		    {'hrsh7th/nvim-cmp'},     -- Required
		    {'hrsh7th/cmp-nvim-lsp'}, -- Required
		    {'L3MON4D3/LuaSnip'},     -- Required
	    }
    },
    'neovim/nvim-lspconfig',
    'jose-elias-alvarez/null-ls.nvim',
    'MunifTanjim/prettier.nvim',
    'jiangmiao/auto-pairs',
    'github/Copilot.vim',
    'christoomey/vim-tmux-navigator',
    'christoomey/vim-tmux-runner',
    {
        "HampusHauffman/block.nvim",
        lazy = true,
        config = function()
            require("block").setup({})
        end
    },
}
local opts = {}
require("lazy").setup(plugins, opts)
