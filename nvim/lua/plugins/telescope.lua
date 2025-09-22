return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 
        {'nvim-lua/plenary.nvim'},
        { -- Fuzzy finder algorithm which requires local dependencies to be built
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = vim.fn.executable 'make' == 1,
        },
    },
    config = function()
        local builtin = require('telescope.builtin')

        require'telescope'.setup {
            defaults = {},
            extensions = {},
            pickers = {
                find_files = {
                    theme = 'dropdown',
                }
            },
        }

        vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
        vim.keymap.set('n', '<leader>sp', builtin.git_files, {})
        vim.keymap.set('n', '<leader>sg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>sb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>sh', builtin.help_tags, {})
        vim.keymap.set('n', '<leader>sr', require('telescope.builtin').oldfiles, { desc = '[.] Find recently opened files' })
        vim.keymap.set('n', '<leader>sc', function()
            require'telescope.builtin'.current_buffer_fuzzy_find(require'telescope.themes'.get_dropdown {
                winblend = 10,
                previewer = false,
            })
        end, { desc = '[/] Fuzzily search in current buffer]' })
    end
}