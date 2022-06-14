local db = require('dashboard')

vim.g.dashboard_default_executive = "telescope"
vim.g.indentLine_fileTypeExclude = { 'dashboard' }

db.custom_center = {
  { icon = '   ', desc = 'Projects       ', shortcut = '<leader> f p', action = "Telescope projects" },
  { icon = '   ', desc = 'Edit Projects  ', shortcut = '<leader> f P', action = "edit ~/.local/share/nvim/project_nvim/project_history" },
  { icon = '   ', desc = 'Colorscheme    ', shortcut = '<leader> f c', action = "Telescope colorscheme" },
  { icon = '   ', desc = 'Recently file  ', shortcut = '<leader> f r', action = "Telescope oldfiles" },
  { icon = '   ', desc = 'Find file      ', shortcut = '<leader> f f', action = "Telescope find_files" },
  { icon = '   ', desc = 'Find text      ', shortcut = '<leader> f t', action = "Telescope live_grep" },
}

db.custom_header = {
  [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
  [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
  [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
  [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
  [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
  [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
  [[                                                   ]],
}

db.custom_footer = {
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
