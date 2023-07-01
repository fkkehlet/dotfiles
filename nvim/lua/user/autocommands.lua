-- ?
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
    command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
    group = packer_group,
    pattern = vim.fn.expand '$MYVIMRC',
})

-- Highlight on yank
vim.cmd([[
    augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=100 }
    augroup end
]])

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
    pattern = { '*' },
    command = [[%s/\s\+$//e]],
})

-- Turn off hard wrap for select filetypes
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
    pattern = { '*.html' },
    command = [[set textwidth=0]],
})

-- -- Ensure treesitter folding works on file open
-- vim.api.nvim_create_autocmd({ 'BufAdd', 'BufEnter', 'BufNew', 'BufNewFile', 'BufWinEnter' }, {
--     pattern = { '*' },
--     command = [[set foldmethod=expr | set foldexpr=nvim_treesitter#foldexpr()]],
-- })
-- vim.cmd([[
-- augroup packer_user_config
-- autocmd!
-- autocmd BufWritePost plugins.lua source <afile>
-- augroup end
-- ]])
