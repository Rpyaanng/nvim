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
  "eandrju/cellular-automaton.nvim", -- <leader>mr make it rain
  "nvim-treesitter/nvim-treesitter",
  { "tpope/vim-surround" },
}
-- Themes end here.

local opts = {}
require("lazy").setup(plugins, opts)
