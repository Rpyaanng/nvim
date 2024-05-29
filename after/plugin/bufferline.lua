vim.keymap.set("n", "<M-1>", "<cmd>lua require('bufferline').go_to(1, true)<CR>", { desc = "Go to Buffer 1." })
vim.keymap.set("n", "<M-2>", "<cmd>lua require('bufferline').go_to(2, true)<CR>", { desc = "Go to Buffer 2." })
vim.keymap.set("n", "<M-3>", "<cmd>lua require('bufferline').go_to(3, true)<CR>", { desc = "Go to Buffer 3." })
vim.keymap.set("n", "<M-4>", "<cmd>lua require('bufferline').go_to(4, true)<CR>", { desc = "Go to Buffer 4." })
vim.keymap.set("n", "<M-5>", "<cmd>lua require('bufferline').go_to(5, true)<CR>", { desc = "Go to Buffer 5." })
vim.keymap.set("n", "<M-6>", "<cmd>lua require('bufferline').go_to(6, true)<CR>", { desc = "Go to Buffer 6." })
vim.keymap.set("n", "<M-7>", "<cmd>lua require('bufferline').go_to(7, true)<CR>", { desc = "Go to Buffer 7." })
vim.keymap.set("n", "<M-8>", "<cmd>lua require('bufferline').go_to(8, true)<CR>", { desc = "Go to Buffer 8." })
vim.keymap.set("n", "<M-9>", "<cmd>lua require('bufferline').go_to(9, true)<CR>", { desc = "Go to Buffer 9." })
vim.keymap.set("n", "<M-$>", "<cmd>lua require('bufferline').go_to(-1, true)<CR>", { desc = "Go to the last buffer." })

local bufferline = require("bufferline")
bufferline.setup({
  options = {
    mode = "tabs",                                  -- only show tabs and not all buffers
    numbers = "ordinal",                            -- add tabs ordinal numbers
    style_preset = bufferline.style_preset.default, -- default|minimal
    color_icons = true,
    tab_size = 22,
    close_icon = "",
    show_buffer_icons = true,
    show_duplicate_prefix = false, -- show base path if tabs have the same name
    diagnostics = "nvim_lsp",      -- nvim lsp diagnostics integration in tabs or false
    indicator = {
      style = "icon",              -- icon|underline|none
    },
    offsets = {
      -- avoid to show bufferline on top nvim-tree
      {
        filetype = "NvimTree",
        text = "File Explorer", -- title on top
        highlight = "Directory",
        separator = true,       -- true is the default, or set custom
      },
      -- avoid to show bufferline on top saga outline symbols
      {
        filetype = "sagaoutline",
        text = "Symbols",  -- title on top
        highlight = "Directory",
        separator = false, -- true is the default, or set custom
      },
    },
    diagnostics_indicator = function(count, level) -- diagnostics format
      return " " .. count
    end,
    -- exclude some buffer and file types
    custom_filter = function(buf_number)
      local buftype = vim.api.nvim_buf_get_option(buf_number, "buftype")
      local filetype = vim.api.nvim_buf_get_option(buf_number, "filetype")

      -- exclude list
      local excluded_filetypes = {
        ["terminal"] = true,
        ["TelescopePrompt"] = true,
        ["NvimTree"] = true,
        ["sagaoutline"] = true,
        ["sagafinder"] = true,
        ["starter"] = true,
      }

      local excluded_buftypes = {
        ["nofile"] = true,
        ["terminal"] = true,
      }

      return not excluded_buftypes[buftype] and not excluded_filetypes[filetype]
    end,
  },
})
