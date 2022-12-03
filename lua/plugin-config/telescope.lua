local status, telescope = pcall(require, "telescope")
if not status then
  vim.notify("没有找到 telescope")
  return
end

-- ====for live_grep raw====:
-- for rp usage: reference: https://segmentfault.com/a/1190000016170184
-- -i ignore case
-- -s 大小写敏感
-- -w match word
-- -e 正则表达式匹配
-- -v 反转匹配
-- -g 通配符文件或文件夹，可以用!来取反
-- -F fixed-string 原意字符串，类似python的 r'xxx'



telescope.setup({
  defaults = {
    -- 打开弹窗后进入的初始模式，默认为 insert，也可以是 normal
    initial_mode = "insert",
    -- 窗口内快捷键
    mappings = require("keybindings").telescopeList,
  },
  pickers = {
    -- 内置 pickers 配置
    find_files = {
      -- 查找文件换皮肤，支持的参数有： dropdown, cursor, ivy
      -- theme = "dropdown",
    }
  },
  extensions = {
    -- 扩展插件配置
  },
})
