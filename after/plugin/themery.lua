-- Minimal config


require("themery").setup({
  themes = {
    {
      name = "tokyonight",
      colorscheme = "tokyonight",
      after = [[
        vim.opt.background = "dark"
        ColorMyPencils()
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
      name = "rose-pine",
      colorscheme = "rose-pine",
      after = [[
        vim.opt.background = "dark"
      ]],
    },
    {
      name = "bluloco-dark",
      colorscheme = "bluloco-dark",
      after = [[
        vim.opt.background = "dark"
        ColorMyPencils()
      ]],
    },
    {
      name = "bluloco-light",
      colorscheme = "bluloco-light",
      after = [[
        vim.opt.background = "light"
        ColorMyPencils()
      ]],
    },
    {
      name = "poimandres",
      colorscheme = "poimandres",
      after = [[
        vim.opt.background = "dark"
        ColorMyPencils()
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
        ColorMyPencils()
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
  },                                                          -- Your list of installed colorschemes
  themeConfigFile = "~/.config/nvim/after/plugin/colors.lua", -- Described below
  livePreview = true,                                         -- Apply theme while browsing. Default to true.
})
