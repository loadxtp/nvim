vim.g.dashboard_default_executive = "telescope"

vim.g.dashboard_custom_section = {
  a = { description = { "  Projects              " }, command = "Telescope projects" },
  b = {
    description = { "  Edit Projects         " },
    command = "edit ~/.local/share/nvim/project_nvim/project_history",
  },
  c = { description = { "  Change colorscheme    " }, command = "DashboardChangeColorscheme" },
  d = { description = { "  Recently files        " }, command = "Telescope oldfiles" },
  e = { description = { "  Find file             " }, command = "Telescope find_files" },
  f = { description = { "  Find text             " }, command = "Telescope live_grep" },
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

vim.g.dashboard_custom_footer = {
  [[  ________________  ]],
  [[ | Hakuna Matata~ | ]],
  [[  ----------------  ]],
  [[  O                 ]],
  [[   O   ^__^             ]],
  [[    O  (oo)\_______     ]],
  [[       (__)\       )\/\ ]],
  [[           ||----w |    ]],
  [[           ||     ||    ]],
  [[                        ]],
}
