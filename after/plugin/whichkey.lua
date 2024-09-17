require('which-key').setup({
  window = {
    border = "none",          -- none, single, double, shadow
    position = "bottom",      -- bottom, top
    margin = { 3, 0, 3, 0 },  -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
    padding = { 3, 2, 3, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 5,             -- value between 0-100 0 for fully opaque and 100 for fully transparent
    zindex = 1000,            -- positive value to position WhichKey above other floating windows.
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3,                    -- spacing between columns
    align = "center",               -- align columns left, center or right
  },
})