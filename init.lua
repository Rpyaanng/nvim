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
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    dependencies = { { 'nvim-lua/plenary.nvim' } }
  },
  'nvim-lua/plenary.nvim',
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = true end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
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
      { 'neovim/nvim-lspconfig' }, -- Required
      {                            -- Optional
        'williamboman/mason.nvim',
        build = ':MasonUpdate'

      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },                  -- Required
      { 'hrsh7th/cmp-nvim-lsp' },              -- Required
      { 'L3MON4D3/LuaSnip' },                  -- Required
    }
  },
  'neovim/nvim-lspconfig',
  'MunifTanjim/prettier.nvim',
  'jiangmiao/auto-pairs',
  'github/Copilot.vim',
  'christoomey/vim-tmux-navigator',
  'christoomey/vim-tmux-runner',
  {
    'terrortylor/nvim-comment',
    config = function()
      require('nvim_comment').setup()
    end
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*", -- Or "branch:main"
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup {}
    end,
  },
  "eandrju/cellular-automaton.nvim",
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", opts = true },
    config = function()
      require('lualine').setup()
    end,
  },
  {
    "klen/nvim-test",
    config = function()
      require('nvim-test').setup()
    end
  },
  {
    "zbirenbaum/copilot.lua",
    lazy = true,
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end
  },
  {
    "xiyaowong/virtcolumn.nvim",
    config = function()
      vim.g.virtcolumn_char = '▕'
      vim.g.virtcolumn_priority = 10
    end
  },
  "lukas-reineke/indent-blankline.nvim",
  {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },

    config = function()
      local alpha = require 'alpha'
      local dashboard = require 'alpha.themes.dashboard'
      dashboard.section.header.val = {
        [[ ,ggg, ,ggggggg,                                                               ]],
        [[dP""Y8,8P"""""Y8b                                                              ]],
        [[Yb, `8dP'     `88                                                              ]],
        [[ `"  88'       88                                        gg                    ]],
        [[     88        88                                        ""                    ]],
        [[     88        88   ,ggg,     ,ggggg,       ggg    gg    gg    ,ggg,,ggg,,ggg, ]],
        [[     88        88  i8" "8i   dP"  "Y8ggg   d8"Yb   88bg  88   ,8" "8P" "8P""8, ]],
        [[     88        88  I8, ,8I  i8'    ,8I    dP  I8   8I    88   I8   8I   8I  8I ]],
        [[     88        Y8, `YbadP' ,d8,   ,d8'  ,dP   I8, ,8I  _,88,_,dP   8I   8I  Yb,]],
        [[     88        `Y8888P"Y888P"Y8888P"    8"     "Y8P"   8P""Y88P'   8I   8I `Y8 ]],
      }

      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
      dashboard.section.buttons.val = {
        dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
        dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
        dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
        dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
        dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
        dashboard.button("t", "🎨" .. " Change Themes", ":Themery <CR>"),
        dashboard.button("q", "X " .. " Quit nvim", ":qa<cr>"),
      }
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
      end
      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.section.footer.opts.hl = "AlphaFooter"
      dashboard.opts.layout[1].val = 8
      local handle = io.popen('fortune')
      local fortune = handle:read("*a")
      handle:close()
      dashboard.section.footer.val = fortune

      dashboard.config.opts.noautocmd = true

      vim.cmd [[autocmd User AlphaReady echo 'ready']]

      alpha.setup(dashboard.config)
    end
  },

  -- Themes Start here
  "zaldih/themery.nvim",
  "catppuccin/nvim",
  'rose-pine/neovim',
  {
    'uloco/bluloco.nvim',
    lazy = false,
    priority = 1000,
    dependencies = { 'rktjmp/lush.nvim' },
  },
  'olivercederborg/poimandres.nvim',
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {},
  },
  -- Themes end here.

}
local opts = {}
require("lazy").setup(plugins, opts)
