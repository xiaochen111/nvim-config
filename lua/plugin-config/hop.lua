-- 如果找不到lualine 组件，就不继续执行
local status, hop = pcall(require, "hop")
if not status then
  vim.notify("没有找到 hop")
  return
end

hop.setup()
