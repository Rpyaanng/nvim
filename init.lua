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
    tag = '0.1.4',
    -- or                            , branch = '0.1.x',
    dependencies = { { 'nvim-lua/plenary.nvim' } }
  },
  'nvim-lua/plenary.nvim',
  {
    'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
      require("ibl").setup()
    end
  },
  {
    'iamcco/markdown-preview.nvim',
    config = function() vim.fn['mkdp#util#install']() end,
  },
  {
    'nacro90/numb.nvim', -- peek lines
    config = function() require('numb').setup() end,
  },

  'folke/trouble.nvim', -- diagnostic and warning menu
  {
    'NvChad/nvim-colorizer.lua',
    config = function()
      require 'colorizer'.setup()
    end
  },
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- required by telescope
      "MunifTanjim/nui.nvim",

      -- optional
      "nvim-treesitter/nvim-treesitter",
      "rcarriga/nvim-notify",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      -- configuration goes here
    },
  },
  'nvim-treesitter/playground',
  'numToStr/Comment.nvim',
  'lewis6991/gitsigns.nvim',
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",  -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed.
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = true
  },
  'theprimeagen/vim-with-me',
  {
    'theprimeagen/harpoon',
    branch = "harpoon2",
    require = {
      "nvim-lua/plenary.nvim"
    }
  },
  'mbbill/undotree',
  'tpope/vim-fugitive', -- Git inside vim!
  'sindrets/diffview.nvim',
  'akinsho/git-conflict.nvim',
  'junegunn/fzf',
  'junegunn/fzf.vim',
  'folke/zen-mode.nvim',
  {
    'MaximilianLloyd/ascii.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim'
    }
  },
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
      { 'hrsh7th/cmp-buffer' },                -- Required
      {
        'L3MON4D3/LuaSnip',
        dependencies = {
          'rafamadriz/friendly-snippets',
        },
      }, -- Required
      { 'saadparwaiz1/cmp_luasnip' }
    }
  },
  'neovim/nvim-lspconfig',
  'MunifTanjim/prettier.nvim',
  'christoomey/vim-tmux-navigator',
  'christoomey/vim-tmux-runner',
  {
    'terrortylor/nvim-comment',
    config = function()
      require('nvim_comment').setup({
        line_mapping = "<leader>cl",
        operator_mapping = "<leader>c",
        comment_chunk_text_object = "ic"
      })
    end
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      view = {
        width = 38,
      },
      renderer = {
        root_folder_label = false, -- hide root directory at the top
        indent_markers = {
          enable = enable,         -- folder level guide
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            bottom = "─",
            none = " ",
          },
        },
        icons = {
          glyphs = {
            folder = {
              default = "",
              open = "",
              empty = "",
              empty_open = "",
            },
            git = {
              unstaged = "",
              staged = "",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
    },
  },
  "nvim-tree/nvim-tree.lua",
  "eandrju/cellular-automaton.nvim", -- <leader>mr make it rain
  'MunifTanjim/nougat.nvim',
  'MunifTanjim/nui.nvim',
  {
    "klen/nvim-test",
    config = function()
      require('nvim-test').setup()
    end
  },
  { "xiyaowong/virtcolumn.nvim" },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
  },
  "edkolev/tmuxline.vim",
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  { "tpope/vim-surround" },
  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
  },
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   main = "ibl",
  --   opts = {},
  --   dependencies = { "HiPhish/rainbow-delimiters.nvim" }
  -- },
  {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'MaximilianLloyd/ascii.nvim'
    },
    config = function()
      local alpha = require 'alpha'
      local dashboard = require 'alpha.themes.dashboard'
      local ascii = require 'ascii'
      dashboard.section.header.val = ascii.get_random("text", "neovim")
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

      vim.cmd [[autocmd User AlphaReady echo 'Ready to code!']]

      alpha.setup(dashboard.config)
    end
  },
  -- lazy.nvim
  -- ColorScheme / themes Start here
  {
    "https://git.sr.ht/~swaits/colorsaver.nvim",
    lazy = true,
    event = "VimEnter",
    opts = {
      -- your options here
    },
  },
  "catppuccin/nvim",
  "ramojus/mellifluous.nvim",
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
  'projekt0n/github-nvim-theme',
  {
    "loctvl842/monokai-pro.nvim",
    config = function()
      require("monokai-pro").setup()
    end
  },
  'sainnhe/sonokai',
  'sainnhe/everforest',
  'chriskempson/base16-vim',
  'cpea2506/one_monokai.nvim',
  'navarasu/onedark.nvim',

  {
    "diegoulloao/neofusion.nvim",
    priority = 1000,
    config = true,
    opts = {
      terminal_colors = true, -- add neovim terminal colors
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true, -- invert background for search, diffs, statuslines and errors
      palette_overrides = {},
      overrides = {},
      dim_inactive = false,
      transparent_mode = true,
    }

  },
}
-- Themes end here.

local opts = {}
require("lazy").setup(plugins, opts)
