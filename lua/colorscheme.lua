vim.o.background = "dark"
-- vim.g.tokyonight_style = "storm" -- day / night
-- vim.g.tokyonight_transparent = true
-- vim.g.tokyonight_transparent_sidebar = true
vim.g.onedark_transparent= true
vim.g.onedark_transparent_sidebar = true
local colorscheme = "onedark"
-- tokyonight
-- OceanicNext
-- nord
-- onedark
-- nightfox
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme: " .. colorscheme .. " 没有找到！")
  return
end
