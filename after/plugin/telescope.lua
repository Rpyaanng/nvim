local builtin = require('telescope.builtin')
local telescope = require('telescope')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pl', builtin.live_grep, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

telescope.load_extension("ascii")
telescope.load_extension('harpoon')

-- require telescope actions
local actions = require("telescope.actions")

-- -- projects extension integration for telescope
-- telescope.load_extension("projects")
--
-- -- persisted extension for session management
-- telescope.load_extension("persisted")

-- custom setup
telescope.setup({
  defaults = {
    layout_strategy = "vertical", -- vertical layout
    sorting_strategy = "ascending",
    results_title = "",
    prompt_prefix = "  ", --  ›
    selection_caret = " › ",
    entry_prefix = "   ", -- each entry result prefix
    layout_config = {
      prompt_position = "top",
      width = 0.7,
      height = 0.6,
    },
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
      },
    },
    -- result numbers at the right: matches|total
    get_status_text = function(picker)
      local total = picker.stats.processed or 0
      local matches = total - (picker.stats.filtered or 0)

      if matches == 0 and total == 0 then
        return ""
      end

      return string.format("%s|%s ", matches, total)
    end,
  },
  pickers = {
    find_files = {
      previewer = false,
      layout_config = {
        prompt_position = "top",
        width = 0.6,
        height = 0.5,
      },
    },
    live_grep = {
      previewer = false,
      prompt_title = "Global Search",
      results_title = "", -- results
      layout_config = {
        prompt_position = "top",
        width = 0.7,
        height = 0.6,
      },
    },
    current_buffer_fuzzy_find = {
      previewer = false,
      prompt_title = "Search",
      results_title = "", -- results
      layout_config = {
        prompt_position = "top",
        width = 0.7,
        height = 0.6,
      },
    },
    buffers = {
      previewer = false,
      layout_config = {
        prompt_position = "top",
        width = 0.6,
        height = 0.5,
      },
    },
    git_bcommits = {
      previewer = false,
      layout_config = {
        prompt_position = "top",
        width = 0.7,
        height = 0.6,
      },
    },
    git_commits = {
      previewer = false,
      layout_config = {
        prompt_position = "top",
        width = 0.7,
        height = 0.6,
      },
    },
    git_status = {
      previewer = false,
      layout_config = {
        prompt_position = "top",
        width = 0.6,
        height = 0.5,
      },
    },
    git_branches = {
      previewer = false,
      layout_config = {
        prompt_position = "top",
        width = 0.6,
        height = 0.5,
      },
      -- overwrite default behavior of checking out to dettached HEAD
      mappings = {
        i = { ["<cr>"] = actions.git_switch_branch },
      },
    },
    diagnostics = {
      previewer = false,
      prompt_title = "Diagnostics",
      layout_config = {
        prompt_position = "top",
        width = 0.6,
        height = 0.5,
      },
    },
    colorscheme = {
      enable_preview = true
    },
  },
  extensions = {
    persisted = {
      layout_config = {
        prompt_position = "top",
        width = 0.6,
        height = 0.5,
      },
    },
  },
})
