local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return tnue
    end
    return false
end

local packer_bootstrap = ensure_packer()

require('packer').reset()
require('packer').init({
    compile_path = vim.fn.stdpath('data')..'/site/plugin/packer_compiled.lua',
    -- display = {
    --    open_fn = function()
    --        return require('packer.util').float({ border='solid' })
    --    end,
    -- }
})



local use = require('packer').use



use 'wbthomason/packer.nvim' -- Packer can manage itself



-- Theme
use('navarasu/onedark.nvim')
    require('onedark').setup {
        style = 'warm',
}
-- require('onedark').load()
use 'shaunsingh/nord.nvim'
vim.cmd[[colorscheme nord]]



use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
        -- Automatically install LSPs to stdpath for neovim
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',

        -- Useful status updates for LSP
        'j-hui/fidget.nvim',

        -- Additional lua configuration, makes nvim stuff amazing
        'folke/neodev.nvim',
    },
}

-- Setup for PHP LSP
use {
    'gbprod/phpactor.nvim',
    run = require('phpactor.handler.update'), -- To install/update phpactor when installing this plugin
    requires = {
        'nvim-lua/plenary.nvim', -- required to update phpactor
        'neovim/nvim-lspconfig' -- required to automaticly register lsp server
    },
    config = function ()
        require('phpactor').setup()
    end,
}

-- Enable the following language servers which will automatically be installed
-- Add any additional override configuration in the following tables. They will be passed to
-- the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
  -- tsserver = {},

  sumneko_lua = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

require('mason').setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'
mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}
mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end



use { -- Autocompletion
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
}
-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local cmp = require 'cmp'
local luasnip = require 'luasnip'

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-nvim-lua'

-- use snippets



-- Git related plugins
use 'tpope/vim-fugitive'
use 'tpope/vim-rhubarb'
use 'lewis6991/gitsigns.nvim'

use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines

use { -- Comment lines with 'gc' and blocks with 'gb'
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}

use 'tpope/vim-surround' -- cs'" to change ' to ".
-- use 'tpope/vim-unimpaired' -- Handy bracket mappings, like [b and ]b
-- use 'tpope/vim-eunuch' -- Useful commands like :Rename and :SudoWrite
-- use 'tpope/vim-sleuth' -- Indent autodetection with editorconfig support
-- use 'sheerun/vim-polyglot' -- More languages
-- use 'christoomey/vim-tmux-navigator' -- Navigate seamlessly between vim windows and tmux panes
-- use 'farmergreg/vim-lastplace' -- Jump to the last location when opening a file
use 'nelstrom/vim-visual-star-search' -- Enable * searching with visually selected text
use 'jessarcher/vim-heritage' -- Automatically create parent dirs when saving

use({ -- Automatically fix indentation when pasting code
    'sickill/vim-pasta',
    config = function ()
        vim.g.pasta_disabled_filetypes = { 'fugitive' }
    end,
})

use({ -- Automatically set the working directory to the project root
    'airblade/vim-rooter',
    setup = function ()
        -- Only run once when vim starts
        vim.g.rooter_manual_only = 1
    end,
    config = function ()
        vim.cmd('Rooter')
    end,
})

use({ -- Automatically add closing brackets, quotes, etc.
   'windwp/nvim-autopairs',
    config = function ()
        require('nvim-autopairs').setup()
    end,
})

use({ -- Close buffers without closing split windows
   'famiu/bufdelete.nvim',
    config = function ()
        vim.keymap.set('n', '<Leader>q', ':bdelete<CR>')
    end,
})



use { -- Split arrays and methods onto multiple lines with gS and rejoin them using gJ
    'AndrewRadev/splitjoin.vim',
    config = function ()
        vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
        vim.g.splitjoin_trailing_comma = 1
        vim.g.splitjoin_php_method_chain_full = 1
    end,
}



use({ -- Faster search with s and S
    'ggandor/leap.nvim',
    requires = 'tpope/vim-repeat', -- Allow plugins to enable repeating of commands
})
require('leap').add_default_mappings()



use { -- Lualine status bar
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}
require('lualine').setup {
    options = {
        icons_enabled = false,
        theme = 'nord',
        component_separators = '|',
        section_separators = '',
    },
}

use 'nvim-tree/nvim-tree.lua' -- File tree
require("nvim-tree").setup({
    disable_netrw = true,
    hijack_netrw = true,
    auto_close = true,
    diagnostics = {
        enable = true,
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    view = {
        width = 30,
        mappings = {
            custom_only = false,
            list = {
                { key = { "l", "<CR>", "o" }, action = "edit" },
                -- { key = "h", action = "close_node" },
                { key = "v", action = "vsplit" },
            },
        },
    },
    renderer = {
        icons = {
            show = {
                file = false,
                folder = true,
                folder_arrow = false,
                git = false,
                modified = false,
            },
        },
    },
})

use { -- Treesitter - highlight, edit, and navigate code
	'nvim-treesitter/nvim-treesitter',
	run = function()
		local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
		ts_update()
	end,
}
use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
}
require('nvim-treesitter.configs').setup {
    -- Add languages to be installed here that you want installed for treesitter
    ensure_installed = { 'c', 'css', 'html', 'javascript', 'lua', 'php', 'python', 'rust', 'typescript', 'help', 'vim' },

    highlight = { enable = true },
    indent = { enable = true, disable = { 'python' } },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<c-a>',
            node_incremental = '<c-a>',
            scope_incremental = '<c-s>',
            node_decremental = '<c-backspace>',
        },
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ['aa'] = '@parameter.outer',
                ['ia'] = '@parameter.inner',
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                [']m'] = '@function.outer',
                [']]'] = '@class.outer',
            },
            goto_next_end = {
                [']M'] = '@function.outer',
                [']['] = '@class.outer',
            },
            goto_previous_start = {
                ['[m'] = '@function.outer',
                ['[['] = '@class.outer',
            },
            goto_previous_end = {
                ['[M'] = '@function.outer',
                ['[]'] = '@class.outer',
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ['<leader>a'] = '@parameter.inner',
            },
            swap_previous = {
                ['<leader>A'] = '@parameter.inner',
            },
        },
    },
}

use { -- Telescope
	'nvim-telescope/telescope.nvim', tag = '0.1.0',
	-- or                            , branch = '0.1.x',
	requires = { {'nvim-lua/plenary.nvim'} },
}
require('telescope').setup {
    defaults = {
        -- ...
    },
    pickers = {
        find_files = {
            theme = "dropdown",
        }
    },
    extensions = {
        -- ...
    }
}

-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if packer_bootstrap then
    require('packer').sync()
end

local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

-- vim.cmd([[
-- augroup packer_user_config
-- autocmd!
-- autocmd BufWritePost plugins.lua source <afile>
-- augroup end
-- ]])


vim.cmd([[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=100 }
augroup end
]])
