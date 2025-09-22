-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

--================--
--  AUTOCOMMANDS  --
--================--

-- Highlight on yank
vim.cmd([[
    augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=100 }
    augroup end
]])

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
    pattern = { '*' },
    command = [[%s/\s\+$//e]],
})

-- Turn off hard wrap for select filetypes
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
    pattern = { '*.html' },
    command = [[set textwidth=0]],
})

--===========--
--  KEYMAPS  --
--===========--

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- LSP
vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

-- Navigate tabs
vim.keymap.set('n', '<A-[>', ':tabp<CR>', {})
vim.keymap.set('n', '<A-]>', ':tabn<CR>', {})
vim.keymap.set('n', '<A-\\>', ':tabclose<CR>', {})

-- Window resizing
vim.keymap.set('n', '<A-<>', '<C-w>5<', {})
vim.keymap.set('n', '<A->>', '<C-w>5>', {})

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

-- Open the current file in the default program
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


-- Yank to and paste from system clipboard
-- vim.keymap.set('n', '<Leader>y', '\"+y')
-- vim.keymap.set('v', '<Leader>y', '\"+y')
-- vim.keymap.set('n', '<Leader>Y', '\"+Y')
-- vim.keymap.set('v', '<Leader>Y', '\"+Y')
-- Preserve yanked text when pasting in visual mode (overwrites register)
vim.keymap.set('x', '<Leader>p', '\"_dP')

-- When text is wrapped move by rows, not lines, unless a count is provided
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true})
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true})

-- Enter commands without Shift
vim.keymap.set("n", ";", ":")
vim.keymap.set("v", ";", ":")

-- Arrow keys to move around windows
vim.keymap.set('n', '<C-k>', '<C-w><Up>')
vim.keymap.set('n', '<C-j>', '<C-w><Down>')
vim.keymap.set('n', '<C-h>', '<C-w><Left>')
vim.keymap.set('n', '<C-l>', '<C-w><Right>')
vim.keymap.set('n', '<Up>', '<C-w><Up>')
vim.keymap.set('n', '<Down>', '<C-w><Down>')
vim.keymap.set('n', '<Left>', '<C-w><Left>')
vim.keymap.set('n', '<Right>', '<C-w><Right>')

-- OPTIONS
vim.opt.backup = false
vim.opt.breakindent = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.confirm = true
vim.opt.expandtab = true
vim.opt.fillchars:append({ eob = ' ' })
vim.opt.foldenable = false
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldmethod = 'expr'
vim.opt.ignorecase = true
vim.opt.linebreak = true
vim.opt.list = true
vim.opt.listchars = { tab = '• ', trail = '·' }
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 0
vim.opt.shiftwidth = 4
vim.opt.sidescrolloff = 0
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.spell = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.textwidth = 0
vim.opt.title = true
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true
vim.opt.wildmode = 'longest:full,full'
vim.opt.wrap = true

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- Import your plugins
        { import = "plugins" },
    },
    install = { colorscheme = { "habamax" } },
    checker = { enabled = true },
})
