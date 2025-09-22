return {
    {
        'mbbill/undotree',
        config = function()
            vim.api.nvim_set_keymap('n', '<leader>u', ':UndotreeToggle<CR>', {noremap = true})
        end
    },
    'nelstrom/vim-visual-star-search',
    'jessarcher/vim-heritage',
    'tpope/vim-surround',
    'tpope/vim-sleuth',
    'lukas-reineke/indent-blankline.nvim',
    'wuelnerdotexe/vim-astro',
    {
        'sickill/vim-pasta',
        config = function()
            vim.g.pasta_disabled_filetypes = { 'fugitive' }
        end,
    },
    {
        'windwp/nvim-autopairs',
        config = function ()
            require('nvim-autopairs').setup()
        end,
    },
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },
    {
        'famiu/bufdelete.nvim',
        config = function ()
            vim.keymap.set('n', '<Leader>q', ':bdelete<CR>')
        end,
    },
    {
        'AndrewRadev/splitjoin.vim',
        config = function ()
            vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
            vim.g.splitjoin_trailing_comma = 1
            vim.g.splitjoin_php_method_chain_full = 1
        end,
    },
    {
        'airblade/vim-rooter',
        init = function ()
            vim.g.rooter_manual_only = 1
        end,
        config = function ()
            vim.cmd('Rooter')
        end,
    },
    {
        'sbdchd/neoformat',
        init = function ()
            vim.g.neoformat_try_node_exe = 1
        end,
    },
}