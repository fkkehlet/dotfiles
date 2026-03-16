return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},
        },
        config = function()
            require('mason').setup()

            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            vim.lsp.config('*', {
                capabilities = capabilities,
            })

            vim.lsp.config('lua_ls', {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" }
                        }
                    }
                }
            })

            vim.lsp.config('html', {
                filetypes = { 'html', 'elixir', 'eelixir', 'heex' },
            })

            vim.lsp.config('emmet_ls', {
                filetypes = { 'html', 'css', 'elixir', 'eelixir', 'heex' },
            })

            vim.lsp.config('tailwindcss', {
                filetypes = { 'html', 'elixir', 'eelixir', 'heex' },
                init_options = {
                    rLanguages = {
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
                root_markers = { 'tailwind.config.js', 'tailwind.config.ts', 'postcss.config.js', 'postcss.config.ts', 'package.json', 'node_modules', '.git', 'mix.exs' },
            })

            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
            })

            require('mason-lspconfig').setup({
                ensure_installed = { 'lua_ls', 'elixirls', 'html', 'emmet_ls', 'tailwindcss' },
            })

            vim.lsp.enable({ 'lua_ls', 'elixirls', 'html', 'emmet_ls', 'tailwindcss' })
        end,
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'L3MON4D3/LuaSnip',
        },
        config = function()
            local cmp = require'cmp'

            local icons = {
              Class = '',
              Color = '',
              Constant = '',
              Constructor = '',
              Enum = '',
              EnumMember = '',
              Event = '',
              Field = '',
              File = '',
              Folder = '',
              Function = "f⒳",
              Interface = '',
              Keyword = '',
              Method = "",
              Module = '',
              Operator = '',
              Property = '',
              Reference = '',
              Snippet = '',
              Struct = '',
              Text = '',
              TypeParameter = '',
              Unit = '',
              Value = '',
              Variable = '',
            }

            local blackOrWhiteFg = function(r,g,b)
              return ((r*0.299 + g*0.587 + b*0.114) > 186) and '#000000' or '#ffffff'
            end

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'buffer' },
                    { name = 'path' },
                    { name = 'neorg' },
                },
                formatting = {
                  format = function(entry, vim_item)
                    if vim_item.kind == 'Color' and entry.completion_item.documentation then
                      local _, _, r, g, b = string.find(entry.completion_item.documentation, '^rgb%((%d+), (%d+), (%d+)')
                      if r then
                        local color = string.format('%02x', r) .. string.format('%02x', g) ..string.format('%02x', b)
                        local group = 'Tw_' .. color
                        if vim.fn.hlID(group) < 1 then
                          vim.api.nvim_set_hl(0, group, {fg = blackOrWhiteFg(r, g, b), bg = '#' .. color})
                        end
                        vim_item.kind = ' ' .. icons[vim_item.kind] .. ' '
                        vim_item.kind_hl_group = group
                        return vim_item
                      end
                    end
                    vim_item.kind = icons[vim_item.kind] and (icons[vim_item.kind] .. vim_item.kind) or vim_item.kind
                    return vim_item
                  end,
                },
            })
        end,
    },
}