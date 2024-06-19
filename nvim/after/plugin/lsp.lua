-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require 'lsp-zero'
lsp.preset('recommended')

lsp.ensure_installed({
    -- 'css-lsp',
    'eslint',
    -- 'html-lsp',
    'intelephense',
    'html',
    'emmet_ls',
    -- 'phpcs',
    -- 'php-cs-fixer',
    -- 'sumneko_lua',
    'elixirls',
    'tsserver',
    'tailwindcss',
})

-- require'lspconfig'.intelephense.setup({})
require'lspconfig'.html.setup{
  filetypes = { 'html', 'eex', 'heex' }
}

require'lspconfig'.emmet_ls.setup{
  filetypes = { 'html', 'eex', 'heex' }
}

require'lspconfig'.tailwindcss.setup({
  init_options = {
    userLanguages = {
      elixir = "html-eex",
      eelixir = "html-eex",
      heex = "html-eex",
    },
  },
})



lsp.set_preferences({
    sign_icons = {}
})

lsp.setup()

vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename)
vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action)
