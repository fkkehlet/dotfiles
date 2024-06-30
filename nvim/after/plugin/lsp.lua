-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require 'lsp-zero'
lsp.preset('recommended')
local lspconfig = require'lspconfig'
local capabilities = vim.lsp.protocol.make_client_capabilities()

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
lspconfig.html.setup{
  filetypes = { 'html', 'elixir', 'eelixir', 'heex' }
}

lspconfig.emmet_ls.setup({
  capabilities = capabilities,
  filetypes = { 'html', 'css', 'elixir', 'eelixir', 'heex' },
})

lspconfig.tailwindcss.setup({
  capabilities = capabilities,
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
})

lsp.set_preferences({
    sign_icons = {}
})

lsp.setup()

vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename)
vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action)
