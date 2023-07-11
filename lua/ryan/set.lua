--[[ Comment:
    Set cursor to a vertical bar in normal mode, block in visual mode,
    and a horizontal bar in replace mode
--]]
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"

vim.opt.termguicolors = true -- enable 24-bit RGB colors

-- highlight current line
vim.opt.cursorline = true

vim.opt.wrap = false          -- wrap lines
vim.opt.display = "lastline"  -- always show the last line
vim.opt.autoread = true       -- automatically reload files changed outside of vim

vim.opt.nu = true             -- show line numbers
vim.opt.relativenumber = true -- show relative line numbers

-- copy indent from current line when starting a new line
vim.opt.autoindent = true

vim.opt.smartindent = true
vim.opt.tabstop = 2      -- number of spaces in tab when editing
vim.opt.softtabstop = 2  -- number of spaces in tab when editing
vim.opt.shiftwidth = 2   -- size of an indent
vim.opt.expandtab = true -- use spaces instead of tabs

-- Use shiftwidths at left margin and tabstops everywhere else.
vim.opt.smarttab = true

vim.opt.shiftround = true     -- round indent to multiple of shiftwidth

vim.opt.swapfile = false      -- no swap file
vim.opt.backup = false        -- no backup file
vim.opt.undofile = true       -- persistent undo

vim.opt.hlsearch = false      -- highlight search results
vim.opt.incsearch = true      -- search as characters are entered

vim.opt.scrolloff = 8         -- keep 8 lines above and below cursor
vim.opt.signcolumn = "yes"    -- always show sign column
vim.opt.isfname:append("@-@") -- allow @ in filenames

-- don't redraw while executing macros (good performance config)
vim.opt.lazyredraw = true

vim.opt.updatetime = 50          -- update interval for gitsigns
vim.opt.showmode = true          -- show current mode
vim.opt.wildmenu = true          -- show possible completions in command line
vim.opt.hidden = true            -- allow switching buffers without saving
vim.opt["foldmethod"] = "indent" -- fold based on indent
vim.opt["foldlevel"] = 99        -- open all folds by default
vim.opt['foldenable'] = true     -- enable folding
