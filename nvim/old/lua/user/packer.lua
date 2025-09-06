-- Installs Packer automatically
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require'packer'.startup(function(use)
    use 'wbthomason/packer.nvim' -- Packer can manage itself

    use { -- Theme
        'folke/tokyonight.nvim',
        config = function()
            vim.cmd('colorscheme tokyonight-night')
        end,
    }

    -- Navigation
    use 'nelstrom/vim-visual-star-search' -- Enable * searching with visually selected text
    use 'theprimeagen/harpoon' -- Harpoon files!
    use {
        'nvim-telescope/telescope.nvim', -- tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'}, },
    }
    use { -- Fuzzy finder algorithm for Terescope which requires local dependencies to be built. Only load if `make` is available
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
        cond = vim.fn.executable 'make' == 1,
    }
    use { -- Faster search with s and S
        'ggandor/leap.nvim',
        requires = 'tpope/vim-repeat', -- Allow plugin to enable repeating of commands
    }
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]]) -- Remove the deprecated commands from v1.x
    use {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v2.x',
        requires = {
            'nvim-lua/plenary.nvim',
            -- 'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
            'MunifTanjim/nui.nvim',
        }
    }


    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
    use { -- Additional treesitter text objects
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
    }

    -- Git
    use 'tpope/vim-fugitive'
    use 'lewis6991/gitsigns.nvim'
    use 'kdheepak/lazygit.nvim'

    -- Indentation
    use 'tpope/vim-sleuth' -- Indent autodetection with editorconfig support
    use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides on blank lines
    use { -- Automatically fix indentation when pasting code
        'sickill/vim-pasta',
        config = function ()
            vim.g.pasta_disabled_filetypes = { 'fugitive' }
        end,
    }

    -- LSP
    use {
        'neovim/nvim-lspconfig',
        requires = {
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



            vim.lsp.config("lua_ls", {
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

            -- local on_attach = function(client, bufnr)
            --     local opts = { buffer = bufnr, noremap = true, silent = true }
            --     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            --     vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            --     vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            --     vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
            --     vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
            --     vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
            --     vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
            --     vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
            -- end

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
                                userLanguages = {
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
    }











    -- Elixir!
    -- use({ "elixir-tools/elixir-tools.nvim", tag = "stable", requires = { "nvim-lua/plenary.nvim" }})

    -- Misc
    -- use 'tpope/vim-unimpaired' -- Handy bracket mappings, like [b and ]b
    -- use 'tpope/vim-eunuch' -- Useful commands like :Rename and :SudoWrite
    -- use 'sheerun/vim-polyglot' -- More languages
    -- use 'christoomey/vim-tmux-navigator' -- Navigate seamlessly between vim windows and tmux panes
    use 'jessarcher/vim-heritage' -- Automatically create parent dirs when saving
    -- use 'farmergreg/vim-lastplace' -- Jump to the last location when opening a file
    use 'mbbill/undotree'
    use 'tpope/vim-surround' -- cs'" to change ' to ".
    use { -- Automatically add closing brackets, quotes, etc.
        'windwp/nvim-autopairs',
        config = function ()
            require('nvim-autopairs').setup()
        end,
    }
    use { -- Comment lines with 'gc' and blocks with 'gb'
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use({ -- Close buffers without closing split windows
        'famiu/bufdelete.nvim',
        config = function ()
            vim.keymap.set('n', '<Leader>q', ':bdelete<CR>')
        end,
    })
    use { -- Split arrays and methods onto multiple lines with gS and rejoin them using gJ
        'AndrewRadev/splitjoin.vim',
        config = function ()
            vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
            vim.g.splitjoin_trailing_comma = 1
            vim.g.splitjoin_php_method_chain_full = 1
        end,
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use { -- Automatically set the working directory to the project root
        'airblade/vim-rooter',
        setup = function ()
            vim.g.rooter_manual_only = 1 -- Only run once when vim starts
        end,
        config = function ()
            vim.cmd('Rooter')
        end,
    }

    use 'jghauser/follow-md-links.nvim'

    -- Astro support
    use 'wuelnerdotexe/vim-astro'

    -- Prettier
    use 'sbdchd/neoformat'
    vim.cmd([[ let g:neoformat_try_node_exe = 1 ]]) -- Use the locally installed version of Prettier

    -- Automatically set up your configuration after cloning packer.nvim (put this at the end after all plugins)
    if packer_bootstrap then
        require'packer'.sync()
    end
end)
