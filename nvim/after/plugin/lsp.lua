-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require 'lsp-zero'
lsp.preset('recommended')

lsp.ensure_installed({
    -- 'css-lsp',
    'eslint',
    -- 'html-lsp',
    'intelephense',
    -- 'phpcs',
    -- 'php-cs-fixer',
    -- 'sumneko_lua',
    'tsserver',
})

-- require'lspconfig'.intelephense.setup({})

lsp.set_preferences({
    sign_icons = {}
})

lsp.setup()

vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename)
vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action)
