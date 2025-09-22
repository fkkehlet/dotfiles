return {
    'L3MON4D3/LuaSnip',
    dependencies = {
        'rafamadriz/friendly-snippets',
    },
    config = function()
        local ls = require("luasnip")
        local s = ls.snippet
        local sn = ls.snippet_node
        local isn = ls.indent_snippet_node
        local t = ls.text_node
        local i = ls.insert_node
        local f = ls.function_node
        local c = ls.choice_node
        local d = ls.dynamic_node
        local r = ls.restore_node
        local events = require("luasnip.util.events")
        local ai = require("luasnip.nodes.absolute_indexer")
        local extras = require("luasnip.extras")
        local l = extras.lambda
        local rep = extras.rep
        local p = extras.partial
        local m = extras.match
        local n = extras.nonempty
        local dl = extras.dynamic_lambda
        local fmt = require("luasnip.extras.fmt").fmt
        local fmta = require("luasnip.extras.fmt").fmta
        local conds = require("luasnip.extras.expand_conditions")
        local postfix = require("luasnip.extras.postfix").postfix
        local types = require("luasnip.util.types")
        local parse = require("luasnip.util.parser").parse_snippet

        ls.setup({
            history = true,
            updateevents = "TextChanged,TextChangedI",
            enable_autosnippets = true,
            ext_opts = {
                [types.choiceNode] = {
                    active = {
                        virt_text = { { "<-", "Error" } },
                    },
                },
            },
        })

        vim.keymap.set({ "i", "s" }, "<C-k>", function()
            if ls.expand_or_jumpable() then
                ls.expand_or_jump()
            end
        end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<C-j>", function()
            if ls.jumpable(-1) then
                ls.jump(-1)
            end
        end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<C-l>", function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end)

        vim.keymap.set("n", "<Leader><Leader>s", ":source ~/.config/nvim/lua/user/plugins/luasnip.lua<CR>")

        ls.add_snippets("html", {
            s("g", {
                t("[ "),
                i(1),
                t(" ]"),
                i(0),
            })
        })

        ls.snippets = {
            lua = {
                s("req", fmt("local {} = require('{}')", { i(1, "default"), rep(1)})),
            },
        }
    end
}