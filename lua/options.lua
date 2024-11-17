require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"

vim.opt.termguicolors = true -- enable 24-bit RGB colors

-- highlight current line
vim.opt.cursorline = true

vim.opt.wrap = false          -- wrap lines
vim.opt.display = "lastline"  -- always show the last line
vim.opt.autoread = true       -- automatically reload files changed outside of vim

vim.opt.nu = true             -- show line numbers
vim.opt.relativenumber = true -- show relative line numbers

vim.opt.cindent = true
vim.opt.tabstop = 2      -- number of spaces in tab when editing
vim.opt.shiftwidth = 4   -- size of an indent
vim.opt.expandtab = true -- use spaces instead of tabs

vim.opt.showtabline = 1
vim.g.tpipeline_autoembed = 1

vim.opt.shiftround = true -- round indent to multiple of shiftwidth
vim.opt.laststatus = 3

vim.opt.swapfile = false         -- no swap file
vim.opt.backup = false           -- no backup fil:qe
vim.opt.undofile = true          -- persistent undo

vim.opt.hlsearch = false         -- highlight search results
vim.opt.incsearch = true         -- search as characters are entered

vim.opt.scrolloff = 8            -- keep 8 lines above and below cursor
vim.opt.signcolumn = "yes"       -- always show sign column
vim.opt.isfname:append("@-@")    -- allow @ in filenames

vim.opt.updatetime = 50          -- update interval for gitsigns
vim.opt.showmode = true          -- show current mode
vim.opt.wildmenu = true          -- show possible completions in command line
vim.opt.hidden = true            -- allow switching buffers without savin
vim.opt["foldmethod"] = "indent" -- fold based on indent
vim.opt["foldlevel"] = 99        -- open all folds by default
vim.opt['foldenable'] = true     -- enable folding

--neovide stuff
--#region
vim.o.guifont = "JetBrainsMono Nerd Font"
vim.g.neovide_cursor_trail_length = 0.05
vim.g.neovide_cursor_animation_length = 0.05
vim.g.neovide_cursor_vfx_mode = "pixiedust"
vim.g.neovide_transparency = 0.95
vim.g.neovide_window_blurred = true
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0
--#endregion
