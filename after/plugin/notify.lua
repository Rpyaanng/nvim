local notify = require('notify')
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  group = neotree_group,
  callback = function()
    vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { link = "BufferLineBackground" })
    vim.api.nvim_set_hl(0, "NeoTreeNormal", { link = "BufferLineBackground" })
  end
})
vim.notify = require('notify')
-- Overriding vim.notify with fancy notify if fancy notify exists
vim.notify = notify
print = function(...)
  local print_safe_args = {}
  local _ = { ... }
  for i = 1, #_ do
    table.insert(print_safe_args, tostring(_[i]))
  end
  notify(table.concat(print_safe_args, ' '), "info")
end
notify.setup()
