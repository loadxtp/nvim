local status, toggleterm = pcall(require, "toggleterm")
if not status then
  vim.notify("没有找到 toggleterm")
  return
end

toggleterm.setup({
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.3
    end
  end,
  start_in_insert = true,
})

local Terminal = require("toggleterm.terminal").Terminal

local lazygit_term = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  on_open = function(term)
    vim.cmd("startinsert!")
    -- q / <leader>tg 关闭 terminal
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<leader>tg", "<cmd>close<CR>", { noremap = true, silent = true })
    -- ESC 键取消，留给lazygit
    if vim.fn.mapcheck("<Esc>", "t") ~= "" then
      vim.api.nvim_del_keymap("t", "<Esc>")
    end
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
  on_close = function(_)
    -- 添加回来
    vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {
      noremap = true,
      silent = true,
    })
  end,
})

local float_term = Terminal:new({
  direction = "float",
  close_on_exit = true,
})

local vertical_term = Terminal:new({
  direction = "vertical",
  close_on_exit = true,
})

local horizon_term = Terminal:new({
  direction = "horizontal",
  close_on_exit = true,
})

local M = {}

M.toggleF = function()
  if float_term:is_open() then
    float_term:close()
    return
  end
  vertical_term:close()
  horizon_term:close()
  float_term:open()
end

M.toggleV = function()
  if vertical_term:is_open() then
    vertical_term:close()
    return
  end
  float_term:close()
  horizon_term:close()
  vertical_term:open()
end

M.toggleH = function()
  if horizon_term:is_open() then
    horizon_term:close()
    return
  end
  float_term:close()
  vertical_term:close()
  horizon_term:open()
end

M.toggleG = function()
  lazygit_term:toggle()
end

return M
