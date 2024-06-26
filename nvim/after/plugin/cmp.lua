local cmp = require'cmp'

-- https://old.reddit.com/r/neovim/comments/103zetf/how_can_i_get_a_vscodelike_tailwind_css/
-- choose your icon chars
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

cmp.setup {
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
        -- or just show the icon
        -- vim_item.kind = icons[vim_item.kind] and icons[vim_item.kind] or vim_item.kind
        return vim_item
      end,
    },

    -- ... more cmp config stuff
    sources = {
        { name = 'neorg' },
    },
}
