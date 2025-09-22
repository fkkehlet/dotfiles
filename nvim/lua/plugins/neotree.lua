return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'MunifTanjim/nui.nvim',
    },
    lazy = false,
    init = function()
        -- Disable netrw to prevent conflicts
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        vim.g.neo_tree_remove_legacy_commands = 1
    end,
    config = function()
        vim.keymap.set('n', '|', ':Neotree toggle current reveal_force_cwd<CR>')
        vim.keymap.set('n', '\\', ':Neotree toggle reveal_force_cwd<CR>')

        require'neo-tree'.setup {
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = false,
                }
            }
        }
    end
}
