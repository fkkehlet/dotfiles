vim.keymap.set('n', '|', ':Neotree toggle current reveal_force_cwd<CR>')
vim.keymap.set('n', '\\', ':Neotree toggle reveal_force_cwd<CR>')
-- vim.keymap.set('n', '\\', ':Neotree toggle float reveal_force_cwd<CR>')

require'neo-tree'.setup {
    filesystem = {
        filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
        }
    }
}
