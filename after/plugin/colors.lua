local function get_color(field)
  return vim.api.nvim_get_hl_by_name(field, true).background
end

ColorMyPencils = function()
  local normal = get_color("Normal")

  if normal then -- idk why this value
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", {
      bg = "none",
      link = 'Normal',
    })
    vim.api.nvim_set_hl(0, 'FloatBorder', {
      bg = 'none',
    })
  else
    local command = "colorscheme " .. vim.g.colors_name
    vim.cmd(command)
  end
end

ColorMyPencils()
-- vim.api.nvim_set_hl(0, "WinSeparator", { bg = "none" })
