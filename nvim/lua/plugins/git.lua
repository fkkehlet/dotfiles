return {
    {
        'tpope/vim-fugitive',
        config = function()
            vim.keymap.set('n', '<Leader>gs', vim.cmd.Git)
        end
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    },
    {
        'kdheepak/lazygit.nvim',
        config = function()
            vim.keymap.set('n', '<Leader>gg', ':LazyGit<CR>')
        end
    },
}