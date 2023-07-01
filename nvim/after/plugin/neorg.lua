require'neorg'.setup {
    load = {
        ['core.defaults'] = {},
        ['core.export'] = {},
        ['core.integrations.nvim-cmp'] = {},
        ['core.completion'] = {
            config = {
                engine = 'nvim-cmp',
            },
        },
        ['core.concealer'] = {
            config = {
                markup_preset = 'dimmed', -- 'conceal' or 'dimmed'
            },

        },
        ['core.esupports.indent'] = {
            config = {
                indents = {
                    heading1 = { indent = 0 },
                    heading2 = { indent = 1 },
                    heading3 = { indent = 2 },
                    heading4 = { indent = 3 },
                    heading5 = { indent = 4 },
                    heading6 = { indent = 5 },
                },
            },
        },
        ['core.esupports.metagen'] = {
            config = {
                type = 'none',
            },
        },
    },
}
