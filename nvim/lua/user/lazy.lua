--[[

This is your Neovim configuration migrated from Packer to lazy.nvim.
To use it:
1. Place this file at ~/.config/nvim/init.lua (or equivalent for your OS).
2. Remove your old packer configuration files.
3. Delete the old packer plugin directory (usually ~/.local/share/nvim/site/pack/packer).
4. Restart Neovim. lazy.nvim will automatically install all the plugins.

--]]

--==============================================================================
-- Bootstrap lazy.nvim
--==============================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--==============================================================================
-- lazy.nvim Plugin Setup
--==============================================================================
require("lazy").setup({
    -- Theme
    {
        "folke/tokyonight.nvim",
        lazy = false, -- make sure we load this during startup
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            vim.cmd.colorscheme "tokyonight-night"
        end,
    },

    --==============================================================================
    -- Navigation
    --==============================================================================
    "nelstrom/vim-visual-star-search", -- Enable * searching with visually selected text
    "theprimeagen/harpoon",

    { -- Fuzzy Finder
        "nvim-telescope/telescope.nvim",
        tag = '0.1.6',
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    { -- Fuzzy finder algorithm for Terescope
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = vim.fn.executable "make" == 1,
        dependencies = { "nvim-telescope/telescope.nvim" },
    },
    { -- Faster search with s and S
        "ggandor/leap.nvim",
        dependencies = { "tpope/vim-repeat" },
    },
    { -- File tree
        "nvim-neo-tree/neo-tree.nvim",
        version = "v3.*",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- optional, for file icons
            "MunifTanjim/nui.nvim",
        },
        init = function ()
          -- Remove deprecated commands from v1.x
          vim.g.neo_tree_remove_legacy_commands = 1
        end,
    },

    --==============================================================================
    -- Treesitter (Syntax Highlighting)
    --==============================================================================
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },

    --==============================================================================
    -- Git Integration
    --==============================================================================
    "tpope/vim-fugitive",
    "lewis6991/gitsigns.nvim",
    {
    "kdheepak/lazygit.nvim",
        keys = {
            'n', '<Leader>gg', ':LazyGit<CR>'
        },
    },

    --==============================================================================
    -- Indentation
    --==============================================================================
    "tpope/vim-sleuth", -- Indent autodetection
    "lukas-reineke/indent-blankline.nvim", -- Indentation guides
    { -- Automatically fix indentation when pasting code
        "sickill/vim-pasta",
        config = function()
            vim.g.pasta_disabled_filetypes = { "fugitive" }
        end,
    },

    --==============================================================================
    -- LSP (Language Server Protocol) & Autocompletion
    --==============================================================================
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
        config = function()
            -- Set up mason.nvim
            require("mason").setup()

            -- Set up lspconfig and mason-lspconfig
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Configure lua_ls
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            })

            -- Configure the diagnostic UI
            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
            })

            -- Setup mason-lspconfig to install servers
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "elixirls", "html", "emmet_ls", "tailwindcss" },
                handlers = {
                    -- Default handler for servers
                    function(server_name)
                        lspconfig[server_name].setup({
                            capabilities = capabilities,
                        })
                    end,
                    -- Custom configurations for specific servers
                    ["html"] = function()
                        lspconfig.html.setup({
                            capabilities = capabilities,
                            filetypes = { "html", "elixir", "eelixir", "heex" },
                        })
                    end,
                    ["emmet_ls"] = function()
                        lspconfig.emmet_ls.setup({
                            capabilities = capabilities,
                            filetypes = { "html", "css", "elixir", "eelixir", "heex" },
                        })
                    end,
                    ["tailwindcss"] = function()
                        lspconfig.tailwindcss.setup({
                            capabilities = capabilities,
                            filetypes = { "html", "elixir", "eelixir", "heex" },
                            init_options = {
                                userLanguages = {
                                    elixir = "html-eex",
                                    eelixir = "html-eex",
                                    heex = "html-eex",
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
                },
            })

            -- Set up nvim-cmp (autocompletion)
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = {
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                },
            })
        end,
    },

    --==============================================================================
    -- Miscellaneous
    --==============================================================================
    "jessarcher/vim-heritage", -- Automatically create parent dirs when saving
    "mbbill/undotree",
    "tpope/vim-surround", -- cs'" to change ' to "

    { -- Automatically add closing brackets, quotes, etc.
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end,
    },
    { -- Comment lines and blocks
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    },
    { -- Close buffers without closing split windows
        "famiu/bufdelete.nvim",
        config = function()
            vim.keymap.set("n", "<Leader>q", ":bdelete<CR>")
        end,
    },
    { -- Split/join code blocks
        "AndrewRadev/splitjoin.vim",
        config = function()
            vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
            vim.g.splitjoin_trailing_comma = 1
            vim.g.splitjoin_php_method_chain_full = 1
        end,
    },
    { -- Status line
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },
    { -- Automatically set working directory to project root
        "airblade/vim-rooter",
        init = function()
            vim.g.rooter_manual_only = 1
        end,
        config = function()
            vim.cmd("Rooter")
        end,
    },
    "jghauser/follow-md-links.nvim",
    "wuelnerdotexe/vim-astro", -- Astro support

    { -- Code formatter
        "sbdchd/neoformat",
        init = function ()
            -- Use the locally installed version of Prettier
            vim.g.neoformat_try_node_exe = 1
        end,
    },

}, {})
