local mark = require 'harpoon.mark'
local ui = require 'harpoon.ui'

vim.keymap.set('n', '<A-m>', mark.add_file)
vim.keymap.set('n', '<A-h>', ui.toggle_quick_menu)
vim.keymap.set('n', '<A-n>', function() ui.nav_file(1) end)
vim.keymap.set('n', '<A-e>', function() ui.nav_file(2) end)
vim.keymap.set('n', '<A-i>', function() ui.nav_file(3) end)
vim.keymap.set('n', '<A-a>', function() ui.nav_file(4) end)
