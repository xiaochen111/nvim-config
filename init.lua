require('config')
-- 基础设置
require('basic')
-- 快捷键映射
require('keybindings')
-- Packer 插件管理
require('plugins')
-- 主题设置 （新增）
require('colorscheme')
-- 自动命令
-- require('autocmd')
require('autocmd')

-- 插件配置
require('plugin-config.nvim-tree')
require('plugin-config.bufferline')
require('plugin-config.lualine')
require('plugin-config.telescope')
require('plugin-config.gitsigns')
require('plugin-config.diffview')
-- autosave
-- require('plugin-config.auto-save')
require('plugin-config.session-manager')
require('plugin-config.hop')
require('plugin-config.dashboard')
require('plugin-config.project')
require('plugin-config.nvim-treesitter')
-- require('plugin-config.surround')
require('plugin-config.comment')
require('plugin-config.nvim-autopairs')
require('plugin-config.aerial')
require('plugin-config.whichkey')
require('plugin-config.nvim-spectre')
require('plugin-config.toggleterm')

-- 内置LSP (新增)
require('lsp.setup')
require('lsp.cmp')
require('lsp.ui')
require('plugin-config.indent-blankline')
--require('lsp.formatter')
-- 自动化格式  这个可能不需要
-- require('lsp.null-ls')
