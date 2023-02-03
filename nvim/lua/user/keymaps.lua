-- Space is the leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Navigate tabs
vim.keymap.set('n', '<A-[>', ':tabp<CR>', {})
vim.keymap.set('n', '<A-]>', ':tabn<CR>', {})
vim.keymap.set('n', '<A-\\>', ':tabclose<CR>', {})

-- Window resizing
vim.keymap.set('n', '<A-<>', '<C-w>10<', {})
vim.keymap.set('n', '<A->>', '<C-w>10>', {})

-- Reselect visual selection after indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Maintain cursor position
vim.keymap.set('v', 'y', 'myy`y')

-- Disable annoying command line typo
vim.keymap.set('n', 'q:', ':q')

-- Easy insertion of a trailing ; or , from insert mode
vim.keymap.set('i', ';;', '<Esc>A;')
vim.keymap.set('i', ',,', '<Esc>A,')

-- Open the current file in the default program (on macOS 'open', on Linux 'xdg-open')
vim.keymap.set('n', '<leader>o', ':!open %<CR><CR>')
vim.keymap.set('n', '<leader>X', ':!chmod +x %<CR>')

-- Write the file only if it's been updated
vim.keymap.set("n", "<leader>w", ":up<CR>")

-- Quickly clear search highlighting
vim.keymap.set('n', '<leader>n', ':nohlsearch<CR>')

-- Replace the words you are on
vim.keymap.set('n', '<Leader>rs', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')

-- Move lines up and down
vim.keymap.set('i', '<A-j>', '<Esc>:move .+1<CR>==gi')
vim.keymap.set('i', '<A-k>', '<Esc>:move .-2<CR>==gi')
vim.keymap.set('n', '<A-j>', ':move .+1<CR>==')
vim.keymap.set('n', '<A-k>', ':move .-2<CR>==')
vim.keymap.set('v', '<A-j>', ":move '>+1<CR>gv=gv")
vim.keymap.set('v', '<A-k>', ":move '<-2<CR>gv=gv")

-- Keep cursor in place when joining lines
vim.keymap.set('n', 'J', 'mzJ`z')

-- Center screen when paging up and down
vim.keymap.set("n", "<C-d>", "<C-d>0zz")
vim.keymap.set("n", "<C-u>", "<C-u>0zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Preserve yanked text when pasting in visual mode
vim.keymap.set('x', '<Leader>p', '\"_dP')

-- Paste replace visual selection without copying it
-- vim.keymap.set('v', '<Leader>p', '\"_dP')

-- Yank to system clipboard
vim.keymap.set('n', '<Leader>y', '\"+y')
vim.keymap.set('v', '<Leader>y', '\"+y')
vim.keymap.set('n', '<Leader>Y', '\"+Y')

-- When text is wrapped move by rows, not lines, unless a count is provided
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true})
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true})

-- Enter commands without Shift
vim.keymap.set("n", ";", ":")
vim.keymap.set("v", ";", ":")

-- Use arrow keys to move around windows
vim.keymap.set('n', '<C-k>', '<C-w><Up>')
vim.keymap.set('n', '<C-j>', '<C-w><Down>')
vim.keymap.set('n', '<C-h>', '<C-w><Left>')
vim.keymap.set('n', '<C-l>', '<C-w><Right>')

vim.keymap.set('n', '<Up>', '<C-w><Up>')
vim.keymap.set('n', '<Down>', '<C-w><Down>')
vim.keymap.set('n', '<Left>', '<C-w><Left>')
vim.keymap.set('n', '<Right>', '<C-w><Right>')
