-- Replace "YourName" with your actual name
local myName = "RyanP"

-- List of common comment patterns in various languages
local comment_patterns = {
  "^%s*//",  -- C, C++, Java, JavaScript, etc.
  "^%s*#",   -- Python, Shell, etc.
  "^%s*--",  -- Lua, Haskell, etc.
  "^%s*/%*", -- Multi-line comment start (C-like)
  "%*/",     -- Multi-line comment end (C-like)
}


-- Keywords to look for (TODO:, FIX:, NOTE:)
local keywords = { "TODO:", "FIX:", "NOTE:" }

-- Function to check if a line is a comment
local function is_comment(line)
  for _, pattern in ipairs(comment_patterns) do
    if line:find(pattern) then
      return true
    end
  end
  return false
end

-- Function to replace the keyword with the keyword and (myName) after the colon is typed
local function replace_keyword_after_colon()
  -- Get the current line
  local line = vim.api.nvim_get_current_line()

  -- Get the current cursor position (row, column)
  local cursor = vim.api.nvim_win_get_cursor(0)
  local cursor_col = cursor[2]

  -- Check the text before the cursor
  local text_before_cursor = line:sub(1, cursor_col)

  -- Check if the line is a comment
  if is_comment(line) then
    -- Check if the text before the cursor ends with any of the keywords (TODO:, FIX:, NOTE:)
    for _, keyword in ipairs(keywords) do
      if text_before_cursor:match(keyword .. "$") then
        -- Ensure the line does not already have the keyword with (YourName)
        if not line:find(keyword .. "%s*%(") then
          -- Replace the keyword (TODO:, FIX:, NOTE:) with keyword (YourName)
          local new_line = line:gsub(keyword, keyword .. " (" .. myName .. ")")

          -- Set the updated line
          vim.api.nvim_set_current_line(new_line)

          -- Adjust the cursor position to prevent jumping around
          local new_cursor_col = cursor_col + #myName + 3 -- adjust for "(YourName)"
          vim.api.nvim_win_set_cursor(0, { cursor[1], new_cursor_col })

          -- Exit after replacing, no need to check other keywords
          break
        end
      end
    end
  end
end

local group = vim.api.nvim_create_augroup("configCommands", { clear = true })

-- Autocommand for TextChangedI (when text is changed in insert mode)
vim.api.nvim_create_autocmd("CursorHoldI", {
  callback = replace_keyword_after_colon,
  pattern = "*",
  group = group
})

---- Auto indent on empty line.
vim.keymap.set('n', 'i', function()
  return string.match(vim.api.nvim_get_current_line(), '%g') == nil
      and "\"_cc" or 'i'
end, { expr = true, noremap = true })
