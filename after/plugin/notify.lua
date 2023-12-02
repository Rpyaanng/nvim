local notify = require('notify')
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
