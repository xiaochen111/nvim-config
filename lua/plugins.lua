local packer = require('packer')
packer.startup({
  function(use)
    -- Packer 可以管理自己本身
    use('wbthomason/packer.nvim')
    -- tokyonight
    use('folke/tokyonight.nvim')
    -- nvim-tree (新增)
    use({ 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' })
    -- bufferline (新增)
    use({ 'akinsho/bufferline.nvim', requires = { 'kyazdani42/nvim-web-devicons', 'moll/vim-bbye' } })
    -- lualine (新增)
    use({ 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons' } })
    use('arkav/lualine-lsp-progress')
    -- telescope （新增）
    use({ 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } })
    use("nvim-telescope/telescope-live-grep-raw.nvim")
    -- dashboard-nvim (新增)
    use('glepnir/dashboard-nvim')
    use('ahmedkhalf/project.nvim')
    -- treesitter （新增）
    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
    --------------------- LSP --------------------
    use({ 'williamboman/nvim-lsp-installer', commit = '36b44679f7cc73968dbb3b09246798a19f7c14e0' })
    -- Lspconfig
    use({ 'neovim/nvim-lspconfig' })
    -- 补全引擎
    use('hrsh7th/nvim-cmp')
    -- use({ "hrsh7th/nvim-cmp", commit = "4f1358e659d51c69055ac935e618b684cf4f1429" })
    -- snippet 引擎
    use('hrsh7th/vim-vsnip')
    -- 补全源
    use('hrsh7th/cmp-vsnip')
    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-path')
    use('hrsh7th/cmp-cmdline')
    -- 常见编程语言代码段
    use('rafamadriz/friendly-snippets')
    -- ui (新增)
    use('onsails/lspkind-nvim')
    -- indent-blankline
    use('lukas-reineke/indent-blankline.nvim')
    use('tami5/lspsaga.nvim')
    -- use("mhartington/formatter.nvim")
    use({ 'jose-elias-alvarez/null-ls.nvim', requires = 'nvim-lua/plenary.nvim' })
    use('b0o/schemastore.nvim')
    use({ 'jose-elias-alvarez/nvim-lsp-ts-utils', requires = 'nvim-lua/plenary.nvim' })
    use('Pocco81/AutoSave.nvim')
    use('Shatur/neovim-session-manager')
    -- similar to turbo console log in vscode. automated logging
    -- use({ "gaelph/logsitter.nvim", requires = { "nvim-treesitter/nvim-treesitter" } })
    -- surround 暂时禁用
    -- use("ur4ltz/surround.nvim")
    -- Comment
    -- nvim-autopairs
    use("windwp/nvim-autopairs")
    -- 这个应该是代码注释的插件  不知道为什么 后面的config 一直报错 这个报错的可能是我在什么地方拷贝过来的
    -- -- use({ 'numToStr/Comment.nvim', config = "require('plugins.comment')" })
    use({ 'numToStr/Comment.nvim' })
    use('JoosepAlviste/nvim-ts-context-commentstring')
    -- 快速找字符
    use('phaazon/hop.nvim')
    -- 代码大纲
    use('stevearc/aerial.nvim')
    -- git插件
    use('lewis6991/gitsigns.nvim')
    use('sindrets/diffview.nvim')
    -- which-key
    use('folke/which-key.nvim')
    -- search and replace
    use('nvim-pack/nvim-spectre')
    -- toggleIterm 悬浮终端
    use('akinsho/toggleterm.nvim')
    -- 你的插件列表...

  end,
  config = {
    -- 并发数限制
    max_jobs = 16,
    -- 自定义源
    git = {
      -- default_url_format = 'https://hub.fastgit.xyz/%s',
      -- default_url_format = 'https://mirror.ghproxy.com/https://github.com/%s',
      default_url_format = 'https://gitcode.net/mirrors/%s',
      -- default_url_format = 'https://gitclone.com/github.com/%s',
      -- default_url_format = 'git@github.com:%s',
    },
  },
})

-- 每次保存 plugins.lua 自动安装插件
pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
