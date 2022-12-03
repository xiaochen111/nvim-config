vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local opt = {
  noremap = true,
  silent = true,
}

-- 本地变量(全局设置)
local map = vim.api.nvim_set_keymap
-- 命令行下 Ctrl+j/k  上一个下一个
map("c", "J", "<C-n>", { noremap = false })
map("c", "K", "<C-p>", { noremap = false })

-- 取消 s 默认功能
-- map("n", "s", "", opt)

-- 关闭当前
-- map('n', 'sc', '<C-w>c', opt)
-- 关闭其他
-- map('n', 'so', '<C-w>o', opt) -- close others


-- 代码折叠
map('n', 'zm', 'zM', opt) -- close others
map('n', 'zr', 'zR', opt) -- close others
map('n', 'zc', 'zC', opt) -- close others
map('n', 'zo', 'zO', opt) -- close others



-- ctrl + hjkl  窗口之间跳转
map('n', '<C-h>', '<C-w>h', opt)
map('n', '<C-j>', '<C-w>j', opt)
map('n', '<C-k>', '<C-w>k', opt)
map('n', '<C-l>', '<C-w>l', opt)
-- 左右比例控制
map('n', '<C-Left>', ':vertical resize -2<CR>', opt)
map('n', '<C-Right>', ':vertical resize +2<CR>', opt)
-- map('n', 's,', ':vertical resize -20<CR>', opt)
-- map('n', 's.', ':vertical resize +20<CR>', opt)
-- 上下比例
-- map('n', 'sj', ':resize +10<CR>', opt)
-- map('n', 'sk', ':resize -10<CR>', opt)
-- map('n', '<C-Down>', ':resize +2<CR>', opt)
-- map('n', '<C-Up>', ':resize -2<CR>', opt)
-- 相等比例
-- map('n', 's=', '<C-w>=', opt)

-- 自定义
-- insert模式转换成normal模式
map('i', 'jj', '<ESC>', opt)

map('n', '<leader>l', '$', opt)
map('n', '<leader>h', '^', opt)
map('n', '<S-u>', '<C-u>', opt)
map('n', '<S-d>', '<C-d>', opt)
map('n', 'reg', ':reg<CR>', opt)
map('n', '<S-j>', '5jj', opt)
map('n', '<S-k>', '5kk', opt)
-- 复制模式下快速移动
map('v', '<S-j>', '5jj', opt)
map('v', '<S-k>', '5kk', opt)

-- 退出
map("n", "qq", ":q!<CR>", opt)
map("n", "<leader>q", ":qa!<CR>", opt)


-- magic search
-- map("n", "/", "/\\v", { noremap = true, silent = false })
-- map("v", "/", "/\\v", { noremap = true, silent = false })

-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- 插件快捷键
local pluginKeys = {}

-- nvim-rree
-- alt + m 键打开关闭tree
map('n', '<A-m>', ':NvimTreeToggle<CR>', opt)
map('n', '<leader>a', ':NvimTreeOpen<CR>', opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
  -- 打开文件或文件夹
  { key = { '<CR>', 'o', '<2-LeftMouse>' }, action = 'edit' },
  { key = { 'l', 'o', '<2-LeftMouse>' }, action = 'edit' },
  { key = "<CR>", action = "edit" },
  { key = 'h', action = 'close_node' },
  -- 显示隐藏文件
  { key = 'i', action = 'toggle_ignored' }, -- Ignore (node_modules)
  { key = '.', action = 'toggle_dotfiles' }, -- Hide (dotfiles)
  -- 文件操作
  { key = '<F5>', action = 'refresh' },
  { key = 'a', action = 'create' },
  { key = 'd', action = 'remove' },
  { key = 'r', action = 'rename' },
  { key = 'x', action = 'cut' },
  { key = 'c', action = 'copy' },
  { key = 'p', action = 'paste' },
  { key = 's', action = 'search_node' },
}

-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
  i = {
    -- 上下移动
    ['J'] = 'move_selection_next',
    ['K'] = 'move_selection_previous',

    ['<Down>'] = 'move_selection_next',
    ['<Up>'] = 'move_selection_previous',
    -- 历史记录
    ['<C-n>'] = 'cycle_history_next',
    ['<C-p>'] = 'cycle_history_prev',
    -- 关闭窗口
    ['<C-c>'] = 'close',
    -- 预览窗口上下滚动
    ['<C-u>'] = 'preview_scrolling_up',
    ['<C-d>'] = 'preview_scrolling_down',
  },
}
-- Telescope
-- 查找文件
map('n', '<C-p>', ':Telescope find_files<CR>', opt)
-- 全局搜索
map('n', '<C-f>', ':Telescope live_grep<CR>', opt)
-- 搜索当前文档里面的变量
map('n', '<leader>s', '<cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>', opt)

-- 搜索最近打开过的项目
map('n', '<leader>p', '<cmd>Telescope projects<cr>', opt)
-- map('n', '<leader>P', '<cmd>SessionManager load_session<cr>', opt)
-- 打开最近打开过的文件
map('n', '<leader>r', '<cmd>Telescope oldfiles<cr>', opt)
-- 打开代码大纲
map('n', '<leader>o', '<cmd>AerialToggle<cr>', opt)




-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
  -- rename
  --[[
  Lspsaga 替换 rn
  mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  --]]
  mapbuf('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', opt)
  -- code action 代码错误自动修改
  -- mapbuf('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opt)
  mapbuf('n', '<C-m>', '<cmd>Lspsaga code_action<CR>', opt)
  -- go xx
  mapbuf('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
  -- 查看定义在哪里引用 gf
  mapbuf('n', 'gu', '<cmd>Lspsaga lsp_finder<CR>', opt)
  -- mapbuf('n', 'gu', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
  mapbuf('n', 'gh', '<cmd>Lspsaga hover_doc<cr>', opt)
  -- mapbuf('n', 'gr', '<cmd>Lspsaga lsp_finder<CR>', opt)
  -- diagnostic
  -- 查看错误 因和git自定义的快捷键重合 先放弃这个配置
  -- mapbuf('n', 'gp', '<cmd>Lspsaga show_line_diagnostics<CR>', opt)
  -- 调整到下一个错误
  mapbuf('n', '<leader>j', '<cmd>Lspsaga diagnostic_jump_next<cr>', opt)
  -- 调整到下一个错误
  mapbuf('n', '<leader>k', '<cmd>Lspsaga diagnostic_jump_prev<cr>', opt)
  -- 重新绑定寻找文件
  -- mapbuf('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opt)
  -- 未用
  -- mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
  -- mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
  -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
  -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
  -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
  -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
  local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
  end
  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
  end


  return {
    -- 上一个
    ["K"] = cmp.mapping.select_prev_item(),
    -- 下一个
    ["J"] = cmp.mapping.select_next_item(),
    -- -- 上一个
    -- ["<C-k>"] = cmp.mapping.select_prev_item(),
    -- -- 下一个
    -- ["<C-j>"] = cmp.mapping.select_next_item(),
    -- 出现补全 强制出现补全 智能提示
    -- ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<A-i>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    -- 取消
    ["<A-,>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- 确认
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace,
    }),
    -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    -- 如果窗口内容太多，可以滚动
    ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    -- snippets 跳转
    ["<C-l>"] = cmp.mapping(function(_)
      if vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      end
    end, { "i", "s" }),
    ["<C-h>"] = cmp.mapping(function()
      if vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),

    -- super Tab
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
    -- end of super Tab
  }
end

-- typescript 快捷键
pluginKeys.mapTsLSP = function(mapbuf)
  mapbuf('n', 'gs', ':TSLspOrganize<CR>', opt)
  mapbuf('n', 'gr', ':TSLspRenameFile<CR>', opt)
  mapbuf('n', 'gi', ':TSLspImportAll<CR>', opt)
end


pluginKeys.comment = {
  -- Normal 模式快捷键
  toggler = {
    line = 'gcc', -- 行注释
    block = 'gbc', -- 块注释
  },
  -- Visual 模式
  opleader = {
    line = 'gc',
    bock = 'gb',
  },
}

-- bufferline
-- 左右Tab切换
map('n', 'E', ':BufferLineCyclePrev<CR>', opt)
map('n', 'R', ':BufferLineCycleNext<CR>', opt)
-- 关闭
--"moll/vim-bbye"
-- 关闭当前标签页
map('n', '<C-w>', ':Bdelete!<CR>', opt)
-- 关闭右边
map('n', 'gxr', ':BufferLineCloseRight<CR>', opt)
-- 关闭左边
map('n', 'gxl', ':BufferLineCloseLeft<CR>', opt)
-- 关闭其他标签页
map("n", "gxx", ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>", opt)
-- 选择关闭
map('n', '<leader>bc', ':BufferLinePickClose<CR>', opt)

-- 修改而不复制
map("n", "c", '\"_c', opt)
map("n", "s", '\"_s', opt)

-- esaymotion配置 快速寻找字符
map('n', 'f', "<cmd>HopChar1<CR>", {})


-- save buffer
map('n', '<C-s>', ':w<cr>', opt)
map('i', '<C-s>', '<Esc>:w<cr>', opt)

-- -- 快速寻找git修改的地方
-- map('n', 'gj', ':Gitsigns next_hunk<CR>',opt)
-- map('n', 'gk', ':Gitsigns prev_hunk<CR>',opt)
--
-- -- reset修改的光标在的位置
-- map('n', 'gr', ':Gitsigns reset_hunk<CR>',opt)
--
-- tips ctrl+$ 唤起弹出成命令行

return pluginKeys
