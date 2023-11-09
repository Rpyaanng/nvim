local modes = {
  ["n"] = { "NORMAL", "StNormalMode" },
  ["niI"] = { "NORMAL i", "StNormalMode" },
  ["niR"] = { "NORMAL r", "StNormalMode" },
  ["niV"] = { "NORMAL v", "StNormalMode" },
  ["no"] = { "N-PENDING", "StNormalMode" },
  ["i"] = { "INSERT", "StInsertMode" },
  ["ic"] = { "INSERT (completion)", "StInsertMode" },
  ["ix"] = { "INSERT completion", "StInsertMode" },
  ["t"] = { "TERMINAL", "StTerminalMode" },
  ["nt"] = { "NTERMINAL", "StNTerminalMode" },
  ["v"] = { "VISUAL", "StVisualMode" },
  ["V"] = { "V-LINE", "StVisualMode" },
  ["Vs"] = { "V-LINE (Ctrl O)", "StVisualMode" },
  ["Vb"] = { "V-BLOCK", "StVisualMode" },
  ["R"] = { "REPLACE", "StReplaceMode" },
  ["Rv"] = { "V-REPLACE", "StReplaceMode" },
  ["s"] = { "SELECT", "StSelectMode" },
  ["S"] = { "S-LINE", "StSelectMode" },
  ["Sb"] = { "S-BLOCK", "StSelectMode" },
  ["c"] = { "COMMAND", "StCommandMode" },
  ["cv"] = { "COMMAND", "StCommandMode" },
  ["ce"] = { "COMMAND", "StCommandMode" },
  ["r"] = { "PROMPT", "StConfirmMode" },
  ["r?"] = { "CONFIRM", "StConfirmMode" },
  ["!"] = { "SHELL", "StTerminalMode" },
}
local function lsp_progress()
  local messages = vim.lsp.util.get_progress_messages()
  if #messages == 0 then
    return { 'tabs' }
  end
  local status = {}
  for _, msg in pairs(messages) do
    table.insert(status, (msg.percentage or 0) .. "%% " .. (msg.title or ""))
  end
  local spinners = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
  local ms = vim.loop.hrtime() / 1000000
  local frame = math.floor(ms / 120) % #spinners
  return table.concat(status, " | ") .. " " .. spinners[frame + 1]
end

require('lualine').setup({
  options = {
    section_separators = { left = '', right = '' },
    hello = 1,
  },
  winbar = {
    lualine_a = {
      { 'filename', separator = { right = '' }, right_padding = 2 },
    },
    lualine_x = {},
    lualine_y = {},
  },
  inactive_winbar = {
    lualine_a = {
      { 'filename', separator = { right = '' }, right_padding = 2 },
    },
    lualine_x = {},
    lualine_y = {},
  },
  sections = {
    lualine_a = { {
      'mode',
      fmt = function()
        local m = vim.api.nvim_get_mode().mode
        return " " .. modes[m][1]
      end
    }
    },
    lualine_c = { lsp_progress },
  }
})
