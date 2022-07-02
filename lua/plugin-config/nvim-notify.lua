-- https://github.com/rcarriga/nvim-notify
local status, notify = pcall(require, "notify")
if not status then
  vim.notify("没有找到 nvim-notify")
  return
end

vim.notify = notify

notify.setup({
  background_colour = "#000000"
})
