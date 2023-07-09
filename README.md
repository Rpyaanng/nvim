# Introduction

Hello this is my Neovim Configuration which uses [lazy package manager](https://github.com/folke/lazy.nvim).

# Packages
| Package | Description |
| :--------| :----------- |
|[nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | This makes code pretty and colorful based on different languages. |
| [morhetz/grubox](https://github.com/morhetz/gruvbox) | A theme which also makes things pretty and colorful. |

I probably have some packages missing from this table to see all of them go to [/init.lua](/init.lua)

# Intro to vim.

| Map | Description |
| :---- | :---- |
| ` <Esc> ` | Escape or go back to Normal mode. |
| ` <leader> ` | This is assigned to spacebar. |
| ` <C-?> ` | This mean to use the ctrl key for the keymap. |
| ` :q ` | Leave vim. |
| ` :w ` | Save file. |
| ` x ` | A character. |
| ` X ` | Shift + character. |
| ` i ` | Insert mode |
| ` a ` | Insert into append |
| ` w ` | Go to the start of the next word in the buffer. |
| ` e ` | Go to the end of the next world in the buffer. |
| ` ge`  | Go to the end of the previous word in the buffer. |
| ` dd ` | Deletes the  current line. |
| ` dw `| Deletes from the cursor to the end of the word  |
| ` diw ` | Deletes the entire word |
| ` za ` |  Toggles code fold. |

# Key maps

| Map | Description | 
| :---- | :---- |
|`<leader>pv`| Opens netrw which is the Vim's native file explorer |
|`<leader>pf`| Opens a fuzzy finder which allows you to access files quickly |
|`<leader>gd`| Views the diagonstics in a floating window |
|`<C-t>` | Toggles Nvim-tree which is displays the the project files in a nice window |
| `J` | Moves the current line down. |
| `K` | Moves the current line up. |
| `<C-e>` | Opens Harpoon menu to quickly change files. |
| `<leader>a` | Adds a file into harpoon. |


For other keymaps please visit [/lua/ryan/keymaps.lua](/lua/ryan/remap.lua) or the keymaps respective config file located in the directory (/after/plugin)[/after/plugin].

# Other

If on Windows I recommend using this with WSL in order to be able to use TMUX for access to sessions as it will make productivity 3x better.

