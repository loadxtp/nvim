local status, lualine = pcall(require, "lualine")
if not status then
  vim.notify("没有找到 lualine")
  return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = " ", warn = " " },
  colored = true,
  update_in_insert = false,
  always_visible = true,
}

local diff = {
  "diff",
  colored = true,
  symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width,
}

local mode = {
  "mode",
  fmt = function(str)
    return "-- " .. str .. " --"
  end,
}

local file_name = {
  "filename",
  file_status = true, -- Displays file status (readonly status, modified status)
  path = 1, -- 0: Just the filename
  -- 1: Relative path
  -- 2: Absolute path

  shorting_target = 40, -- Shortens path to leave 40 spaces in the window
  -- for other components. (terrible name, any suggestions?)
  symbols = {
    modified = "[+]", -- Text to show when the file is modified.
    readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
    unnamed = "[No Name]", -- Text to show for unnamed buffers.
  },
  {
    "lsp_progress",
    spinner_symbols = { " ", " ", " ", " ", " ", " " },
  },
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = "",
}

local location = {
  "location",
  padding = 0,
}

-- cool function for progress
local progress = function()
  local current_line = vim.fn.line(".")
  local total_lines = vim.fn.line("$")
  local chars = { "██", "▇▇", "▆▆", "▅▅", "▄▄", "▃▃", "▂▂", "▁▁", " " }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index]
end

local spaces = function()
  return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
  options = {
    -- 指定皮肤
    -- https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
    theme = "auto",
    icons_enabled = true,
    always_divide_middle = true,
    globalstatus = true,
    -- disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
    -- 分割线
    component_separators = { left = "|", right = "|" },
    section_separators = {
      left = " ",
      right = "",
    },
  },
  extensions = { "nvim-tree" },
  sections = {
    lualine_a = { branch, diagnostics },
    lualine_b = { mode },
    lualine_c = { file_name },
    lualine_x = {
      diff,
      spaces,
      "encoding",
      "filetype",
      "fileformat",
    },
    lualine_y = { location },
    lualine_z = { progress },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { file_name },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
})
