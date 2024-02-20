local harpoon = require('harpoon')
harpoon:setup({})

vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end, { desc = "Add current file to Harpooon." })
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Go to Harpoon file 1." })
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Go to Harpoon file 2." })
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Go to Harpoon file 3." })
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Go to Harpoon file 4." })
vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end, { desc = "Go to Harpoon file 5." })

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require("telescope.pickers").new({}, {
    prompt_title = "Harpoon",
    finder = require("telescope.finders").new_table({
      results = file_paths,
    }),
    previewer = conf.file_previewer({}),
    sorter = conf.generic_sorter({}),
  }):find()
end

vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
  { desc = "Open harpoon window" })
