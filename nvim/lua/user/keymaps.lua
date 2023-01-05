-- Space is the leader
vim.g.mapleader = ' '
vim.g.maploaclleader = ' '

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>.', require('telescope.builtin').oldfiles, { desc = '[.] Find recently opened files' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

-- Reselect visual selection after indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Maintain cursor position
vim.keymap.set('v', 'y', 'myy`y')

-- Disable annoying command line typo
vim.keymap.set('n', 'q:', ':q')

-- Paste replace visual selection without copying it
vim.keymap.set('v', 'p', '"_dP')

-- Easy insertion of a trailing ; or , from insert mode
vim.keymap.set('i', ';;', '<Esc>A;')
vim.keymap.set('i', ',,', '<Esc>A,')

-- Open the current file in the default program (on macOS 'open', on Linux 'xdg-open')
vim.keymap.set('n', '<Leader>x', ':!open %<CR><CR>')

-- Move lines up and down using Shift+Alt
vim.keymap.set('i', '<A-J>', '<Esc>:move .+1<CR>==gi')
vim.keymap.set('i', '<A-K>', '<Esc>:move .-2<CR>==gi')
vim.keymap.set('n', '<A-J>', ':move .+1<CR>==')
vim.keymap.set('n', '<A-K>', ':move .-2<CR>==')
vim.keymap.set('v', '<A-J>', ":move '>+1<CR>gv=gv")
vim.keymap.set('v', '<A-K>', ":move '<-2<CR>gv=gv")

-- Same keymaps as above, fixed for macOS
vim.keymap.set('i', '˜', '<Esc>:move .+1<CR>==gi')
vim.keymap.set('i', '´', '<Esc>:move .-2<CR>==gi')
vim.keymap.set('n', '˜', ':move .+1<CR>==')
vim.keymap.set('n', '´', ':move .-2<CR>==')
vim.keymap.set('v', '˜', ":move '>+1<CR>gv=gv")
vim.keymap.set('v', '´', ":move '<-2<CR>gv=gv")

-- Center cursor on screen when paging up and down
vim.keymap.set("n", "<C-d>", "<C-d>0zz")
vim.keymap.set("n", "<C-u>", "<C-u>0zz")

-- Quickly clear search highlighting
vim.keymap.set('n', '<Leader>n', ':nohlsearch<CR>')

-- When text is wrapped move by rows, not lines, unless a count is provided
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true})
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true})



-- Colemak remapping

-- -- Movement keys
-- vim.keymap.set("n", "n", "j")
-- vim.keymap.set("n", "e", "k")
-- vim.keymap.set("v", "n", "j")
-- vim.keymap.set("v", "e", "k")

-- -- 'k' is the new 'next'
-- vim.keymap.set("n", "k", "n")
-- vim.keymap.set("n", "K", "N")
-- vim.keymap.set("v", "k", "n")
-- vim.keymap.set("v", "K", "N")

-- -- 'j' is the new 'end of word'
-- vim.keymap.set("n", "j", "e")
-- vim.keymap.set("n", "J", "E")
-- vim.keymap.set("v", "j", "e")
-- vim.keymap.set("v", "J", "E")

-- Enter a command without Shift
vim.keymap.set("n", ";", ":")
vim.keymap.set("v", ";", ":")

-- Use arrow keys to move around windows
vim.keymap.set("n", "<up>", "<C-w><up>")
vim.keymap.set("n", "<down>", "<C-w><down>")
vim.keymap.set("n", "<left>", "<C-w><left>")
vim.keymap.set("n", "<right>", "<C-w><right>")

-- Space+w to write
vim.keymap.set("n", "<Leader>w", ":up<CR>")
