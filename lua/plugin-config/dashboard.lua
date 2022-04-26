vim.g.dashboard_default_executive = "telescope"
vim.g.dashboard_custom_footer = { " https://github.com/loadxtp" }

vim.g.dashboard_custom_section = {
  a = { description = { "  Projects              " }, command = "Telescope projects" },
  b = { description = { "  Recently files        " }, command = "Telescope oldfiles" },
  c = {
    description = { "  Edit Projects         " },
    command = "edit ~/.local/share/nvim/project_nvim/project_history",
  },
  d = { description = { "  Find file             " }, command = "Telescope find_files" },
  e = { description = { "  Find text             " }, command = "Telescope live_grep" },
  f = { description = { "  Change colorscheme    " }, command = "DashboardChangeColorscheme" },
  -- g = { description = { "  Edit .bashrc          " }, command = "edit ~/.bashrc" },
  -- h = { description = { "  Edit keybindings      " }, command = "edit ~/.config/nvim/lua/keybindings.lua" },
}

vim.g.dashboard_custom_header = {
  [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
  [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
  [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
  [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
  [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
  [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
  [[                                                   ]],
}
