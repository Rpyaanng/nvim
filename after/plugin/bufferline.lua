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

require("bufferline").setup({
  options = {
    separator_style = "slant",
    offsets = {
      {
        filetype = "neo-tree",
        text = "EXPLORER",
        separator = true,
        text_align = "center",
      },
    },
    custom_areas = {
      right = function()
        local result = {}
        local seve = vim.diagnostic.severity
        local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
        local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
        local info = #vim.diagnostic.get(0, { severity = seve.INFO })
        local hint = #vim.diagnostic.get(0, { severity = seve.HINT })
        if error ~= 0 then
          table.insert(result, { text = "  " .. error, fg = "#EC5241" })
        end

        if warning ~= 0 then
          table.insert(result, { text = "  " .. warning, fg = "#EFB839" })
        end

        if hint ~= 0 then
          table.insert(result, { text = "  " .. hint, fg = "#A3BA5E" })
        end

        if info ~= 0 then
          table.insert(result, { text = "  " .. info, fg = "#7EA9A7" })
        end
        return result
      end,
    },
  },
})
