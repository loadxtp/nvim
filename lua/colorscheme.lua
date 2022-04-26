vim.o.background = "dark"

-- tokyonight
vim.g.tokyonight_style = "storm" -- day / night
vim.g.tokyonight_transparent = true
vim.g.tokyonight_transparent_sidebar = true

-- onedark
vim.g.onedark_transparent = true
vim.g.onedark_transparent_sidebar = true

-- catppuccin
local catppuccin = require("catppuccin")
catppuccin.setup({
  transparent_background = true,
  term_color = false,
  nvimtree = true,
  integrations = {
    nvimtree = {
      enabled = true,
      show_root = true, -- makes the root folder not transparent
      transparent_panel = true, -- make the panel transparent
    },
  },
})

local colorscheme = "catppuccin"
-- catppuccin
-- tokyonight
-- nord
-- onedark

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme: " .. colorscheme .. " 没有找到！")
  return
end
