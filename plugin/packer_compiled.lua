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
local package_path_str = "/Users/chenhaibo/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/chenhaibo/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/chenhaibo/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/chenhaibo/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/chenhaibo/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
  ["AutoSave.nvim"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/AutoSave.nvim",
    url = "https://gitcode.net/mirrors/Pocco81/AutoSave.nvim"
  },
  ["Comment.nvim"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://gitcode.net/mirrors/numToStr/Comment.nvim"
  },
  ["aerial.nvim"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/aerial.nvim",
    url = "https://gitcode.net/mirrors/stevearc/aerial.nvim"
  },
  ["bufferline.nvim"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://gitcode.net/mirrors/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://gitcode.net/mirrors/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://gitcode.net/mirrors/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://gitcode.net/mirrors/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://gitcode.net/mirrors/hrsh7th/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://gitcode.net/mirrors/hrsh7th/cmp-vsnip"
  },
  ["dashboard-nvim"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/dashboard-nvim",
    url = "https://gitcode.net/mirrors/glepnir/dashboard-nvim"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://gitcode.net/mirrors/sindrets/diffview.nvim"
  },
  ["formatter.nvim"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/formatter.nvim",
    url = "https://gitcode.net/mirrors/mhartington/formatter.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://gitcode.net/mirrors/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://gitcode.net/mirrors/lewis6991/gitsigns.nvim"
  },
  ["hop.nvim"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://gitcode.net/mirrors/phaazon/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://gitcode.net/mirrors/lukas-reineke/indent-blankline.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://gitcode.net/mirrors/onsails/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://gitcode.net/mirrors/tami5/lspsaga.nvim"
  },
  ["lualine-lsp-progress"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/lualine-lsp-progress",
    url = "https://gitcode.net/mirrors/arkav/lualine-lsp-progress"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://gitcode.net/mirrors/nvim-lualine/lualine.nvim"
  },
  ["neovim-session-manager"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/neovim-session-manager",
    url = "https://gitcode.net/mirrors/Shatur/neovim-session-manager"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://gitcode.net/mirrors/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://gitcode.net/mirrors/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://gitcode.net/mirrors/hrsh7th/nvim-cmp"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://gitcode.net/mirrors/williamboman/nvim-lsp-installer"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils",
    url = "https://gitcode.net/mirrors/jose-elias-alvarez/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://gitcode.net/mirrors/neovim/nvim-lspconfig"
  },
  ["nvim-spectre"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/nvim-spectre",
    url = "https://gitcode.net/mirrors/nvim-pack/nvim-spectre"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://gitcode.net/mirrors/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://gitcode.net/mirrors/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://gitcode.net/mirrors/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://gitcode.net/mirrors/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://gitcode.net/mirrors/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://gitcode.net/mirrors/nvim-lua/plenary.nvim"
  },
  ["project.nvim"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "https://gitcode.net/mirrors/ahmedkhalf/project.nvim"
  },
  ["schemastore.nvim"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/schemastore.nvim",
    url = "https://gitcode.net/mirrors/b0o/schemastore.nvim"
  },
  ["telescope-live-grep-raw.nvim"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/telescope-live-grep-raw.nvim",
    url = "https://gitcode.net/mirrors/nvim-telescope/telescope-live-grep-raw.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://gitcode.net/mirrors/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://gitcode.net/mirrors/akinsho/toggleterm.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://gitcode.net/mirrors/folke/tokyonight.nvim"
  },
  ["vim-bbye"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/vim-bbye",
    url = "https://gitcode.net/mirrors/moll/vim-bbye"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://gitcode.net/mirrors/hrsh7th/vim-vsnip"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/Users/chenhaibo/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://gitcode.net/mirrors/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)

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
