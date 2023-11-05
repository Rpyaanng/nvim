ColorMyPencils = function()
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", {
    bg = "none",
    link = 'Normal',
  })
  vim.api.nvim_set_hl(0, 'FloatBorder', {
    bg = 'none',
  })
end

-- Themery block
-- This block will be replaced by Themery.
vim.cmd("colorscheme default")

vim.opt.background = "dark"
vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })

vim.g.theme_id = 1
-- end themery block
