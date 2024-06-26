-- Minimal config

require("themery").setup({
  themes = { -- Your list of installed colorschemes
    {
      name = "default",
      colorscheme = "default",
      after = [[
        vim.opt.background = "dark"
        vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
        vim.api.nvim_set_hl(0, "NormalFloat", {bg = "#111111"})
      ]],
    },
    {
      name = "neofusion",
      colorscheme = "neofusion",
      after = [[
        vim.opt.background = "dark"
        ColorMyPencils()
      ]],
    },
    {
      name = "tokyonight",
      colorscheme = "tokyonight",
      after = [[
        vim.opt.background = "dark"
        ]],
    },
    {
      name = "catppuccin",
      colorscheme = "catppuccin",
      after = [[
        vim.opt.background = "dark"
        ColorMyPencils()
      ]],
    },
    {
      name = "catppuccin-macchiato",
      colorscheme = "catppuccin-macchiato",
      after = [[
        vim.opt.background = "dark"
      ]],
    },
    {
      name = "rose-pine",
      colorscheme = "rose-pine",
      after = [[
        vim.opt.background = "dark"
      ]],
    },
    {
      name = "mellifluous",
      colorscheme = "mellifluous",
      after = [[
        vim.opt.background = "dark"
      ]],
    },
    {
      name = "bluloco-dark",
      colorscheme = "bluloco-dark",
      after = [[
        vim.opt.background = "dark"
      ]],
    },
    {
      name = "bluloco-light",
      colorscheme = "bluloco-light",
      after = [[
        vim.opt.background = "light"
      ]],
    },
    {
      name = "poimandres",
      colorscheme = "poimandres",
      after = [[
        vim.opt.background = "dark"
      ]],
    },
    {
      name = "github dark",
      colorscheme = "github_dark",
      after = [[
        vim.opt.background = "dark"
      ]],
    },
    {
      name = "github light",
      colorscheme = "github_light",
      after = [[
        vim.opt.background = "light"
      ]],
    },
    {
      name = "monokai pro",
      colorscheme = "monokai-pro",
      after = [[
        vim.opt.background = "dark"
      ]],
    },
    {
      name = "sonokai",
      colorscheme = "sonokai",
      after = [[
        vim.opt.background = "dark"
      ]],
    },
    {
      name = "everforest dark",
      colorscheme = "everforest",
      after = [[
        vim.opt.background = "dark"
        vim.g.everforest_background = 'soft'
      ]],
    },
    {
      name = "everforest light",
      colorscheme = "everforest",
      after = [[
        vim.opt.background = "light"
        vim.g.everforest_background = 'soft'
      ]],
    },
    {
      name = "base16-default-dark",
      colorscheme = "base16-default-dark",
      after = [[
        vim.opt.background = "dark"
      ]],
    },
    {
      name = "onedark",
      colorscheme = "onedark",
      after = [[
        vim.opt.background = "dark"
      ]],
    },
    {
      name = "one_monokai",
      colorscheme = "one_monokai",
      after = [[
        vim.opt.background = "dark"
      ]],
    },
  },
  themeConfigFile = "~/.config/nvim/after/plugin/colors.lua", -- Described below
  livePreview = true,                                         -- Apply theme while browsing. Default to true.
})
