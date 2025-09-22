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

-- Format with Prettier on save
-- vim.api.nvim_create_autocmd({ 'BufWritePre', 'InsertLeave' }, {
--     pattern = { '*.astro', '*.html', '*.md' },
--     command = [[Neoformat]],
-- })

-- Turn off hard wrap for select filetypes
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
    pattern = { '*.html' },
    command = [[set textwidth=0]],
})

-- -- Ensure treesitter folding works on file open
-- vim.api.nvim_create_autocmd({ 'BufAdd', 'BufEnter', 'BufNew', 'BufNewFile', 'BufWinEnter' }, {
--     pattern = { '*' },
--     command = [[set foldmethod=expr | set foldexpr=nvim_treesitter#foldexpr()]],
-- })
-- vim.cmd([[
-- augroup packer_user_config
-- autocmd!
-- autocmd BufWritePost plugins.lua source <afile>
-- augroup end
-- ]])





--===========--
--  KEYMAPS  --
--===========--

-- -- Make sure to setup `mapleader` and `maplocalleader` before
-- -- loading lazy.nvim so that mappings are correct.
-- -- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- LSP
-- Open float diagnostics
vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
-- * `K`: Displays hover information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.hover()
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
-- * `gd`: Jumps to the definition of the symbol under the cursor. See :help vim.lsp.buf.definition()
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
-- * `gD`: Jumps to the declaration of the symbol under the cursor. Some servers don't implement this feature. See :help vim.lsp.buf.declaration()
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
-- * `gi`: Lists all the implementations for the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.implementation()
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
-- * `go`: Jumps to the definition of the type of the symbol under the cursor. See :help vim.lsp.buf.type_definition()
vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
-- * `gr`: Lists all the references to the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.references()
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
-- * `gs`: Displays signature information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.signature_help()
vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
-- * `<F2>`: Renames all references to the symbol under the cursor. See :help vim.lsp.buf.rename()
--
-- * `<F3>`: Format code in current buffer. See :help vim.lsp.buf.format()
--
-- * `<F4>`: Selects a code action available at the current cursor position. See :help vim.lsp.buf.code_action()
--
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
--  arrow keys to move around windows
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
vim.opt.confirm = true -- ask for confirmation instead of erroring
vim.opt.expandtab = true
vim.opt.fillchars:append({ eob = ' ' }) -- remove the ~ from end of buffer
vim.opt.foldenable = false
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldmethod = 'expr'
vim.opt.ignorecase = true
vim.opt.linebreak = true
vim.opt.list = true -- enable the below listchars
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
vim.opt.wildmode = 'longest:full,full' -- complete the longest common match, and allowing tabbing the results to fully complete them
vim.opt.wrap = true






-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- -- import your plugins
        -- { import = "plugins" },

        { -- Theme
            'folke/tokyonight.nvim',
            config = function()
                vim.cmd('colorscheme tokyonight-night')
            end,
        },

        -- Navigation
        'nelstrom/vim-visual-star-search', -- Enable * searching with visually selected text
        'theprimeagen/harpoon', -- Harpoon files!
        {
            'nvim-telescope/telescope.nvim', -- tag = '0.1.0',
            dependencies = { {'nvim-lua/plenary.nvim'}, },
        },
        { -- Fuzzy finder algorithm for Terescope which requires local dependencies to be built. Only load if `make` is available
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = vim.fn.executable 'make' == 1,
        },
        { -- Faster search with s and S
            'ggandor/leap.nvim',
            dependencies = 'tpope/vim-repeat', -- Allow plugin to enable repeating of commands
        },

        {
            'nvim-neo-tree/neo-tree.nvim',
            branch = 'v2.x',
            dependencies = {
                'nvim-lua/plenary.nvim',
                -- 'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
                'MunifTanjim/nui.nvim',
            },
            lazy = false,
            init = function()
                vim.g.neo_tree_remove_legacy_commands = 1
            end,
        },


        -- Treesitter
        {
            'nvim-treesitter/nvim-treesitter',
            build = function()
                local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
                ts_update()
            end,
        },
        { -- Additional treesitter text objects
            'nvim-treesitter/nvim-treesitter-textobjects',
            after = 'nvim-treesitter',
        },

        -- Git
        'tpope/vim-fugitive',
        'lewis6991/gitsigns.nvim',
        'kdheepak/lazygit.nvim',

        -- Indentation
        'tpope/vim-sleuth', -- Indent autodetection with editorconfig support
        'lukas-reineke/indent-blankline.nvim', -- Add indentation guides on blank lines
        { -- Automatically fix indentation when pasting code
            'sickill/vim-pasta',
            config = function()
                vim.g.pasta_disabled_filetypes = { 'fugitive' }
            end,
        },

        -- LSP
        {
            'neovim/nvim-lspconfig',
            dependencies = {
                {'williamboman/mason.nvim'},
                {'williamboman/mason-lspconfig.nvim'},
                -- Keep your completion setup
                {'hrsh7th/nvim-cmp'},
                {'hrsh7th/cmp-buffer'},
                {'hrsh7th/cmp-path'},
                {'saadparwaiz1/cmp_luasnip'},
                {'hrsh7th/cmp-nvim-lsp'},
                {'hrsh7th/cmp-nvim-lua'},
                -- Keep snippets
                {'L3MON4D3/LuaSnip'},
                {'rafamadriz/friendly-snippets'},
            },
            config = function()
                -- Set up mason.nvim
                require('mason').setup()

                -- Set up lspconfig and mason-lspconfig
                local lspconfig = require('lspconfig')
                local capabilities = require('cmp_nvim_lsp').default_capabilities()



                lspconfig.lua_ls.setup({
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" }
                            }
                        }
                    }
                })

                -- NEW: Configure the diagnostic UI
                vim.diagnostic.config({
                    virtual_text = true,
                    -- virtual_lines = true,
                    signs = true,
                    underline = true,
                    update_in_insert = false,
                    severity_sort = true,
                })

                require('mason-lspconfig').setup({
                    ensure_installed = { 'lua_ls', 'elixirls', 'html', 'emmet_ls', 'tailwindcss' },
                    handlers = {
                        function(server_name)
                            lspconfig[server_name].setup({
                                capabilities = capabilities,
                                -- on_attach = on_attach,
                            })
                        end,
                        -- Custom configurations for specific servers
                        ['html'] = function()
                            lspconfig.html.setup({
                                capabilities = capabilities,
                                -- on_attach = on_attach,
                                filetypes = { 'html', 'elixir', 'eelixir', 'heex' }
                            })
                        end,
                        ['emmet_ls'] = function()
                            lspconfig.emmet_ls.setup({
                                capabilities = capabilities,
                                -- on_attach = on_attach,
                                filetypes = { 'html', 'css', 'elixir', 'eelixir', 'heex' },
                            })
                        end,
                        ['tailwindcss'] = function()
                            lspconfig.tailwindcss.setup({
                                capabilities = capabilities,
                                -- on_attach = on_attach,
                                filetypes = { 'html', 'elixir', 'eelixir', 'heex' },
                                init_options = {
                                    rLanguages = {
                                        elixir = 'html-eex',
                                        eelixir = 'html-eex',
                                        heex = 'html-eex',
                                    },
                                },
                                settings = {
                                    tailwindCSS = {
                                        experimental = {
                                            classRegex = {
                                                'class[:]\\s*"([^"]*)"',
                                            },
                                        },
                                    },
                                },
                                root_dir = lspconfig.util.root_pattern('tailwind.config.js', 'tailwind.config.ts', 'postcss.config.js', 'postcss.config.ts', 'package.json', 'node_modules', '.git', 'mix.exs'),
                            })
                        end,
                    }
                })

                -- Set up nvim-cmp (autocompletion)
                local cmp = require('cmp')
                cmp.setup({
                    snippet = {
                        expand = function(args)
                            require('luasnip').lsp_expand(args.body)
                        end,
                    },
                    mapping = cmp.mapping.preset.insert({
                        ['<C-Space>'] = cmp.mapping.complete(),
                        ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    }),
                    sources = {
                        { name = 'nvim_lsp' },
                        { name = 'luasnip' },
                        { name = 'buffer' },
                        { name = 'path' },
                    },
                })
            end,
        },

        -- Misc
        --  'tpope/vim-unimpaired' -- Handy bracket mappings, like [b and ]b
        --  'tpope/vim-eunuch' -- ful commands like :Rename and :SudoWrite
        --  'sheerun/vim-polyglot' -- More languages
        --  'christoomey/vim-tmux-navigator' -- Navigate seamlessly between vim windows and tmux panes
        'jessarcher/vim-heritage', -- Automatically create parent dirs when saving
        --  'farmergreg/vim-lastplace' -- Jump to the last location when opening a file
        'mbbill/undotree',
        'tpope/vim-surround', -- cs'" to change ' to ".
        { -- Automatically add closing brackets, quotes, etc.
            'windwp/nvim-autopairs',
            config = function ()
                require('nvim-autopairs').setup()
            end,
        },
        { -- Comment lines with 'gc' and blocks with 'gb'
            'numToStr/Comment.nvim',
            config = function()
                require('Comment').setup()
            end
        },
        { -- Close buffers without closing split windows
            'famiu/bufdelete.nvim',
            config = function ()
                vim.keymap.set('n', '<Leader>q', ':bdelete<CR>')
            end,
        },
        { -- Split arrays and methods onto multiple lines with gS and rejoin them using gJ
            'AndrewRadev/splitjoin.vim',
            config = function ()
                vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
                vim.g.splitjoin_trailing_comma = 1
                vim.g.splitjoin_php_method_chain_full = 1
            end,
        },
        {
            'nvim-lualine/lualine.nvim',
            dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
        },
        { -- Automatically set the working directory to the project root
            'airblade/vim-rooter',
            init = function ()
                vim.g.rooter_manual_only = 1 -- Only run once when vim starts
            end,
            config = function ()
                vim.cmd('Rooter')
            end,
        },

        -- 'jghar/follow-md-links.nvim',

        -- Astro support
        'wuelnerdotexe/vim-astro',

        -- Prettier
        {
            'sbdchd/neoformat',
            init = function ()
                vim.g.neoformat_try_node_exe = 1 --  the locally installed version of Prettier
            end,
        },
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be d when installing plugins.
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})





















