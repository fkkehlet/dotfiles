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
-- vim.keymap.set('n', '<leader>ps', function()
--     builtin.grep_string({ search = vim.fn.input('Grep > ') })
-- end)
vim.keymap.set('n', '<leader>sb', builtin.buffers, {})
vim.keymap.set('n', '<leader>sh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').oldfiles, { desc = '[.] Find recently opened files' })
vim.keymap.set('n', '<leader>sc', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require'telescope.builtin'.current_buffer_fuzzy_find(require'telescope.themes'.get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer]' })

