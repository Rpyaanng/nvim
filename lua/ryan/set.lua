vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20" -- set cursor to a vertical bar in normal mode, block in visual mode, and a horizontal bar in replace mode
vim.opt.termguicolors = true -- enable 24-bit RGB colors 

vim.opt.cursorline = true -- highlight current linen-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
vim.opt.wrap = false -- wrap lines
vim.opt.display = "lastline" -- always show the last line
vim.opt.autoread = true -- automatically reload files changed outside of vim

vim.opt.nu = true -- show line numbers
vim.opt.relativenumber = true -- show relative line numbers

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4 -- number of spaces in tab when editing
vim.opt.softtabstop = 4 -- number of spaces in tab when editing
vim.opt.shiftwidth = 4 -- size of an indent
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.smarttab = true -- use shiftwidths at left margin and tabstops everywhere else
vim.opt.shiftround = true -- round indent to multiple of shiftwidth

vim.opt.swapfile = false -- no swap file
vim.opt.backup = false -- no backup file
vim.opt.undofile = true -- persistent undo

vim.opt.hlsearch = false -- highlight search results
vim.opt.incsearch = true -- search as characters are entered

vim.opt.scrolloff = 8 -- keep 8 lines above and below cursor
vim.opt.signcolumn = "yes" -- always show sign column
vim.opt.isfname:append("@-@") -- allow @ in filenames
vim.opt.lazyredraw = true -- don't redraw while executing macros (good performance config)
vim.opt.updatetime = 50 
vim.opt.showmode = true -- show current mode
vim.opt.wildmenu = true -- show possible completions in command line
vim.opt.colorcolumn = "80" -- highlight 80th column

vim.opt["foldmethod"] = "indent" -- fold based on indent
vim.opt["foldlevel"] = 99 -- open all folds by default
vim.opt['foldenable'] = true -- enable folding
