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
  },                                                          -- Your list of installed colorschemes
  themeConfigFile = "~/.config/nvim/after/plugin/colors.lua", -- Described below
  livePreview = true,                                         -- Apply theme while browsing. Default to true.
})
