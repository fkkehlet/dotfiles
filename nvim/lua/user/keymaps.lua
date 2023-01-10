-- Space is the leader
vim.g.mapleader = ' '
vim.g.maploaclleader = ' '

-- Tree file explorer
vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<CR>')

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sp', builtin.find_files, {})
vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
vim.keymap.set('n', '<leader>sg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>sb', builtin.buffers, {})
vim.keymap.set('n', '<leader>sh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').oldfiles, { desc = '[.] Find recently opened files' })
vim.keymap.set('n', '<leader>sc', function()
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
vim.keymap.set('n', '<leader>x', ':!open %<CR><CR>')

-- Write the file only if it's been updated
vim.keymap.set("n", "<leader>w", ":up<CR>")

-- File explore
vim.keymap.set('n', '<leader>p', vim.cmd.Ex)

-- Quickly clear search highlighting
vim.keymap.set('n', '<leader>n', ':nohlsearch<CR>')

-- Move lines up and down using Alt
vim.keymap.set('i', '<A-j>', '<Esc>:move .+1<CR>==gi')
vim.keymap.set('i', '<A-k>', '<Esc>:move .-2<CR>==gi')
vim.keymap.set('n', '<A-j>', ':move .+1<CR>==')
vim.keymap.set('n', '<A-k>', ':move .-2<CR>==')
vim.keymap.set('v', '<A-j>', ":move '>+1<CR>gv=gv")
vim.keymap.set('v', '<A-k>', ":move '<-2<CR>gv=gv")

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

-- When text is wrapped move by rows, not lines, unless a count is provided
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true})
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true})

-- Enter commands without Shift
vim.keymap.set("n", ";", ":")
vim.keymap.set("v", ";", ":")

-- Use arrow keys to move around windows
vim.keymap.set("n", "<C-k>", "<C-w><up>")
vim.keymap.set("n", "<C-j>", "<C-w><down>")
vim.keymap.set("n", "<C-h>", "<C-w><left>")
vim.keymap.set("n", "<C-l>", "<C-w><right>")

vim.keymap.set("n", "<up>", "<C-w><up>")
vim.keymap.set("n", "<down>", "<C-w><down>")
vim.keymap.set("n", "<left>", "<C-w><left>")
vim.keymap.set("n", "<right>", "<C-w><right>")
