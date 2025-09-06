-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/frederik/.cache/nvim/packer_hererocks/2.1.1753364724/share/lua/5.1/?.lua;/home/frederik/.cache/nvim/packer_hererocks/2.1.1753364724/share/lua/5.1/?/init.lua;/home/frederik/.cache/nvim/packer_hererocks/2.1.1753364724/lib/luarocks/rocks-5.1/?.lua;/home/frederik/.cache/nvim/packer_hererocks/2.1.1753364724/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/frederik/.cache/nvim/packer_hererocks/2.1.1753364724/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["bufdelete.nvim"] = {
    config = { "\27LJ\2\nO\0\0\5\0\6\0\b6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0B\0\4\1K\0\1\0\17:bdelete<CR>\14<Leader>q\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/start/bufdelete.nvim",
    url = "https://github.com/famiu/bufdelete.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["follow-md-links.nvim"] = {
    loaded = true,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/start/follow-md-links.nvim",
    url = "https://github.com/jghauser/follow-md-links.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  harpoon = {
    loaded = true,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/theprimeagen/harpoon"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lazygit.nvim"] = {
    loaded = true,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/start/lazygit.nvim",
    url = "https://github.com/kdheepak/lazygit.nvim"
  },
  ["leap.nvim"] = {
    loaded = true,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/start/leap.nvim",
    url = "https://github.com/ggandor/leap.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["neo-tree.nvim"] = {
    loaded = true,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  neoformat = {
    loaded = true,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/start/neoformat",
    url = "https://github.com/sbdchd/neoformat"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nO\0\1\5\2\3\0\b-\1\0\0008\1\0\0019\1\0\0015\3\1\0-\4\1\0=\4\2\3B\1\2\1K\0\1\0\0À\1À\17capabilities\1\0\1\17capabilities\0\nsetupŽ\1\0\0\4\2\6\0\n-\0\0\0009\0\0\0009\0\1\0005\2\2\0-\3\1\0=\3\3\0025\3\4\0=\3\5\2B\0\2\1K\0\1\0\0À\1À\14filetypes\1\5\0\0\thtml\velixir\feelixir\theex\17capabilities\1\0\2\17capabilities\0\14filetypes\0\nsetup\thtml–\1\0\0\4\2\6\0\n-\0\0\0009\0\0\0009\0\1\0005\2\2\0-\3\1\0=\3\3\0025\3\4\0=\3\5\2B\0\2\1K\0\1\0\0À\1À\14filetypes\1\6\0\0\thtml\bcss\velixir\feelixir\theex\17capabilities\1\0\2\17capabilities\0\14filetypes\0\nsetup\remmet_lsü\4\0\0\r\2\29\0#-\0\0\0009\0\0\0009\0\1\0005\2\2\0-\3\1\0=\3\3\0025\3\4\0=\3\5\0025\3\a\0005\4\6\0=\4\b\3=\3\t\0025\3\15\0005\4\r\0005\5\v\0005\6\n\0=\6\f\5=\5\14\4=\4\16\3=\3\17\2-\3\0\0009\3\18\0039\3\19\3'\5\20\0'\6\21\0'\a\22\0'\b\23\0'\t\24\0'\n\25\0'\v\26\0'\f\27\0B\3\t\2=\3\28\2B\0\2\1K\0\1\0\0À\1À\rroot_dir\fmix.exs\t.git\17node_modules\17package.json\22postcss.config.ts\22postcss.config.js\23tailwind.config.ts\23tailwind.config.js\17root_pattern\tutil\rsettings\16tailwindCSS\1\0\1\16tailwindCSS\0\17experimental\1\0\1\17experimental\0\15classRegex\1\0\1\15classRegex\0\1\2\0\0\25class[:]\\s*\"([^\"]*)\"\17init_options\18userLanguages\1\0\1\18userLanguages\0\1\0\3\velixir\rhtml-eex\theex\rhtml-eex\feelixir\rhtml-eex\14filetypes\1\5\0\0\thtml\velixir\feelixir\theex\17capabilities\1\0\5\14filetypes\0\rsettings\0\17init_options\0\rroot_dir\0\17capabilities\0\nsetup\16tailwindcssC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequireî\a\1\0\f\0006\0W6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0026\1\0\0'\3\4\0B\1\2\0029\1\5\1B\1\1\0026\2\6\0009\2\a\0029\2\b\2'\4\t\0005\5\17\0005\6\15\0005\a\r\0005\b\v\0005\t\n\0=\t\f\b=\b\14\a=\a\16\6=\6\18\5B\2\3\0016\2\6\0009\2\19\0029\2\b\0025\4\20\0B\2\2\0016\2\0\0'\4\21\0B\2\2\0029\2\2\0025\4\23\0005\5\22\0=\5\24\0045\5\27\0003\6\25\0>\6\1\0053\6\26\0=\6\28\0053\6\29\0=\6\30\0053\6\31\0=\6 \5=\5!\4B\2\2\0016\2\0\0'\4\"\0B\2\2\0029\3\2\0025\5&\0005\6$\0003\a#\0=\a%\6=\6'\0059\6(\0029\6)\0069\6*\0065\b,\0009\t(\0029\t+\tB\t\1\2=\t-\b9\t(\0029\t.\t5\v/\0B\t\2\2=\t0\bB\6\2\2=\6(\0054\6\5\0005\a1\0>\a\1\0065\a2\0>\a\2\0065\a3\0>\a\3\0065\a4\0>\a\4\6=\0065\5B\3\2\0012\0\0€K\0\1\0\fsources\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\t<CR>\1\0\1\vselect\2\fconfirm\14<C-Space>\1\0\2\t<CR>\0\14<C-Space>\0\rcomplete\vinsert\vpreset\fmapping\fsnippet\1\0\3\fmapping\0\fsnippet\0\fsources\0\vexpand\1\0\1\vexpand\0\0\bcmp\rhandlers\16tailwindcss\0\remmet_ls\0\thtml\1\0\3\16tailwindcss\0\remmet_ls\0\thtml\0\0\0\21ensure_installed\1\0\2\21ensure_installed\0\rhandlers\0\1\6\0\0\vlua_ls\relixirls\thtml\remmet_ls\16tailwindcss\20mason-lspconfig\1\0\5\18severity_sort\2\21update_in_insert\1\14underline\2\nsigns\2\17virtual_text\2\15diagnostic\rsettings\1\0\1\rsettings\0\bLua\1\0\1\bLua\0\16diagnostics\1\0\1\16diagnostics\0\fglobals\1\0\1\fglobals\0\1\2\0\0\bvim\vlua_ls\vconfig\blsp\bvim\25default_capabilities\17cmp_nvim_lsp\14lspconfig\nsetup\nmason\frequire\0" },
    loaded = true,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["splitjoin.vim"] = {
    config = { "\27LJ\2\n¨\1\0\0\2\0\5\0\r6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0K\0\1\0$splitjoin_php_method_chain_full\29splitjoin_trailing_comma2splitjoin_html_attributes_bracket_on_new_line\6g\bvim\0" },
    loaded = true,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/start/splitjoin.vim",
    url = "https://github.com/AndrewRadev/splitjoin.vim"
  },
  ["telescope-fzf-native.nvim"] = {
    cond = { true },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/opt/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0!colorscheme tokyonight-night\bcmd\bvim\0" },
    loaded = true,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-astro"] = {
    loaded = true,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/start/vim-astro",
    url = "https://github.com/wuelnerdotexe/vim-astro"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-heritage"] = {
    loaded = true,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/start/vim-heritage",
    url = "https://github.com/jessarcher/vim-heritage"
  },
  ["vim-pasta"] = {
    config = { "\27LJ\2\nG\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\rfugitive\29pasta_disabled_filetypes\6g\bvim\0" },
    loaded = true,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/start/vim-pasta",
    url = "https://github.com/sickill/vim-pasta"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-rooter"] = {
    config = { "\27LJ\2\n*\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\vRooter\bcmd\bvim\0" },
    loaded = true,
    needs_bufread = false,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/opt/vim-rooter",
    url = "https://github.com/airblade/vim-rooter"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/start/vim-sleuth",
    url = "https://github.com/tpope/vim-sleuth"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-visual-star-search"] = {
    loaded = true,
    path = "/home/frederik/.local/share/nvim/site/pack/packer/start/vim-visual-star-search",
    url = "https://github.com/nelstrom/vim-visual-star-search"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: vim-rooter
time([[Setup for vim-rooter]], true)
try_loadstring("\27LJ\2\n4\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\23rooter_manual_only\6g\bvim\0", "setup", "vim-rooter")
time([[Setup for vim-rooter]], false)
time([[packadd for vim-rooter]], true)
vim.cmd [[packadd vim-rooter]]
time([[packadd for vim-rooter]], false)
-- Config for: bufdelete.nvim
time([[Config for bufdelete.nvim]], true)
try_loadstring("\27LJ\2\nO\0\0\5\0\6\0\b6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0B\0\4\1K\0\1\0\17:bdelete<CR>\14<Leader>q\6n\bset\vkeymap\bvim\0", "config", "bufdelete.nvim")
time([[Config for bufdelete.nvim]], false)
-- Config for: vim-rooter
time([[Config for vim-rooter]], true)
try_loadstring("\27LJ\2\n*\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\vRooter\bcmd\bvim\0", "config", "vim-rooter")
time([[Config for vim-rooter]], false)
-- Config for: tokyonight.nvim
time([[Config for tokyonight.nvim]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0!colorscheme tokyonight-night\bcmd\bvim\0", "config", "tokyonight.nvim")
time([[Config for tokyonight.nvim]], false)
-- Config for: vim-pasta
time([[Config for vim-pasta]], true)
try_loadstring("\27LJ\2\nG\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\rfugitive\29pasta_disabled_filetypes\6g\bvim\0", "config", "vim-pasta")
time([[Config for vim-pasta]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nO\0\1\5\2\3\0\b-\1\0\0008\1\0\0019\1\0\0015\3\1\0-\4\1\0=\4\2\3B\1\2\1K\0\1\0\0À\1À\17capabilities\1\0\1\17capabilities\0\nsetupŽ\1\0\0\4\2\6\0\n-\0\0\0009\0\0\0009\0\1\0005\2\2\0-\3\1\0=\3\3\0025\3\4\0=\3\5\2B\0\2\1K\0\1\0\0À\1À\14filetypes\1\5\0\0\thtml\velixir\feelixir\theex\17capabilities\1\0\2\17capabilities\0\14filetypes\0\nsetup\thtml–\1\0\0\4\2\6\0\n-\0\0\0009\0\0\0009\0\1\0005\2\2\0-\3\1\0=\3\3\0025\3\4\0=\3\5\2B\0\2\1K\0\1\0\0À\1À\14filetypes\1\6\0\0\thtml\bcss\velixir\feelixir\theex\17capabilities\1\0\2\17capabilities\0\14filetypes\0\nsetup\remmet_lsü\4\0\0\r\2\29\0#-\0\0\0009\0\0\0009\0\1\0005\2\2\0-\3\1\0=\3\3\0025\3\4\0=\3\5\0025\3\a\0005\4\6\0=\4\b\3=\3\t\0025\3\15\0005\4\r\0005\5\v\0005\6\n\0=\6\f\5=\5\14\4=\4\16\3=\3\17\2-\3\0\0009\3\18\0039\3\19\3'\5\20\0'\6\21\0'\a\22\0'\b\23\0'\t\24\0'\n\25\0'\v\26\0'\f\27\0B\3\t\2=\3\28\2B\0\2\1K\0\1\0\0À\1À\rroot_dir\fmix.exs\t.git\17node_modules\17package.json\22postcss.config.ts\22postcss.config.js\23tailwind.config.ts\23tailwind.config.js\17root_pattern\tutil\rsettings\16tailwindCSS\1\0\1\16tailwindCSS\0\17experimental\1\0\1\17experimental\0\15classRegex\1\0\1\15classRegex\0\1\2\0\0\25class[:]\\s*\"([^\"]*)\"\17init_options\18userLanguages\1\0\1\18userLanguages\0\1\0\3\velixir\rhtml-eex\theex\rhtml-eex\feelixir\rhtml-eex\14filetypes\1\5\0\0\thtml\velixir\feelixir\theex\17capabilities\1\0\5\14filetypes\0\rsettings\0\17init_options\0\rroot_dir\0\17capabilities\0\nsetup\16tailwindcssC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequireî\a\1\0\f\0006\0W6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0026\1\0\0'\3\4\0B\1\2\0029\1\5\1B\1\1\0026\2\6\0009\2\a\0029\2\b\2'\4\t\0005\5\17\0005\6\15\0005\a\r\0005\b\v\0005\t\n\0=\t\f\b=\b\14\a=\a\16\6=\6\18\5B\2\3\0016\2\6\0009\2\19\0029\2\b\0025\4\20\0B\2\2\0016\2\0\0'\4\21\0B\2\2\0029\2\2\0025\4\23\0005\5\22\0=\5\24\0045\5\27\0003\6\25\0>\6\1\0053\6\26\0=\6\28\0053\6\29\0=\6\30\0053\6\31\0=\6 \5=\5!\4B\2\2\0016\2\0\0'\4\"\0B\2\2\0029\3\2\0025\5&\0005\6$\0003\a#\0=\a%\6=\6'\0059\6(\0029\6)\0069\6*\0065\b,\0009\t(\0029\t+\tB\t\1\2=\t-\b9\t(\0029\t.\t5\v/\0B\t\2\2=\t0\bB\6\2\2=\6(\0054\6\5\0005\a1\0>\a\1\0065\a2\0>\a\2\0065\a3\0>\a\3\0065\a4\0>\a\4\6=\0065\5B\3\2\0012\0\0€K\0\1\0\fsources\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\t<CR>\1\0\1\vselect\2\fconfirm\14<C-Space>\1\0\2\t<CR>\0\14<C-Space>\0\rcomplete\vinsert\vpreset\fmapping\fsnippet\1\0\3\fmapping\0\fsnippet\0\fsources\0\vexpand\1\0\1\vexpand\0\0\bcmp\rhandlers\16tailwindcss\0\remmet_ls\0\thtml\1\0\3\16tailwindcss\0\remmet_ls\0\thtml\0\0\0\21ensure_installed\1\0\2\21ensure_installed\0\rhandlers\0\1\6\0\0\vlua_ls\relixirls\thtml\remmet_ls\16tailwindcss\20mason-lspconfig\1\0\5\18severity_sort\2\21update_in_insert\1\14underline\2\nsigns\2\17virtual_text\2\15diagnostic\rsettings\1\0\1\rsettings\0\bLua\1\0\1\bLua\0\16diagnostics\1\0\1\16diagnostics\0\fglobals\1\0\1\fglobals\0\1\2\0\0\bvim\vlua_ls\vconfig\blsp\bvim\25default_capabilities\17cmp_nvim_lsp\14lspconfig\nsetup\nmason\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: splitjoin.vim
time([[Config for splitjoin.vim]], true)
try_loadstring("\27LJ\2\n¨\1\0\0\2\0\5\0\r6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0K\0\1\0$splitjoin_php_method_chain_full\29splitjoin_trailing_comma2splitjoin_html_attributes_bracket_on_new_line\6g\bvim\0", "config", "splitjoin.vim")
time([[Config for splitjoin.vim]], false)
-- Conditional loads
time([[Conditional loading of telescope-fzf-native.nvim]], true)
  require("packer.load")({"telescope-fzf-native.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of telescope-fzf-native.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-treesitter ]]
vim.cmd [[ packadd nvim-treesitter-textobjects ]]
time([[Sequenced loading]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
