-- https://github.com/folke/which-key.nvim

local M = {}

M.config = {
  ---@usage disable which-key completely [not recommended]
  active = true,
  on_config_done = nil,
  setup = {
    plugins = {
      marks = true, -- shows a list of your marks on ' and `
      registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      presets = {
        operators = false, -- adds help for operators like d, y, ...
        motions = false, -- adds help for motions
        text_objects = false, -- help for text objects triggered after entering an operator
        windows = false, -- default bindings on <c-w>
        nav = true, -- misc bindings to work with windows
        z = true, -- bindings for folds, spelling and others prefixed with z
        g = true, -- bindings for prefixed with g
      },
      spelling = { enabled = true, suggestions = 20 }, -- use which-key for spelling hints
    },
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and it's label
      group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
      scroll_down = "<c-d>", -- binding to scroll down inside the popup
      scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
    window = {
      border = "single", -- none, single, double, shadow
      position = "bottom", -- bottom, top
      margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
      padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
      winblend = 0,
    },
    layout = {
      height = { min = 4, max = 25 }, -- min and max height of the columns
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 3, -- spacing between columns
      align = "left", -- align columns left, center or right
    },
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
    show_help = true, -- show help message on the command line when the popup is visible
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
      -- list of mode / prefixes that should never be hooked by WhichKey
      -- this is mostly relevant for key maps that start with a native binding
      -- most people should not need to change this
      i = { "j", "k" },
      v = { "j", "k" },
    },
  },

  opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
  },
  vopts = {
    mode = "v", -- VISUAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
  },
  topts = {
    mode = "t", -- TERMINAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
  },
  -- NOTE: Prefer using : over <cmd> as the latter avoids going back in normal-mode.
  -- see https://neovim.io/doc/user/map.html#:map-cmd
  mappings = {
    [";"] = { "<cmd>Dashboard<CR>", "Dashboard" },
    ["w"] = { "<cmd>w!<CR>", "Save" },
    ["W"] = { "<cmd>wa<CR>", "Save all" },
    ["q"] = { "<cmd>qa<CR>", "Quit" },
    ["Q"] = { "<cmd>wqa!<CR>", "Quit!" },
    ["E"] = { "<cmd>e ~/.config/nvim/init.lua<CR>", "Edit config" },
    ["a"] = { "<cmd>ClangdSwitchSourceHeader<CR>", "ClangdSwitchSourceHeader" },
    ["n"] = { "<cmd>NvimTreeToggle<CR>", "NvimTreeToggle" },
    ["o"] = { "<cmd>SymbolsOutline<CR>", "SymbolsOutline" },
    b = {
      name = "Buffers",
      j = { "<cmd>BufferLinePick<cr>", "Jump" },
      f = { "<cmd>Telescope buffers<cr>", "Find" },
      b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
      -- w = { "<cmd>BufferWipeout<cr>", "Wipeout" }, -- TODO: implement this for bufferline
      e = {
        "<cmd>BufferLinePickClose<cr>",
        "Pick which buffer to close",
      },
      h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
      l = {
        "<cmd>BufferLineCloseRight<cr>",
        "Close all to the right",
      },
      D = {
        "<cmd>BufferLineSortByDirectory<cr>",
        "Sort by directory",
      },
      L = {
        "<cmd>BufferLineSortByExtension<cr>",
        "Sort by language",
      },
    },
    -- " Available Debug Adapters:
    -- "   https://microsoft.github.io/debug-adapter-protocol/implementors/adapters/
    -- " Adapter configuration and installation instructions:
    -- "   https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
    -- " Debug Adapter protocol:
    -- "   https://microsoft.github.io/debug-adapter-protocol/
    -- " Debugging
    d = {
      name = "DAP",
      d = { "<cmd>RustDebuggables<cr>", "Start debug" },
      e = {
        "<cmd>lua require'dap'.close()<cr>"
            .. "<cmd>lua require'dap'.terminate()<cr>"
            .. "<cmd>lua require'dap.repl'.close()<cr>"
            .. "<cmd>lua require'dapui'.close()<cr>"
            .. "<cmd>lua require'dap'.clear_breakpoints()<cr>"
            .. "<C-w>o<cr>",
        "Stop debug",
      },
      -- 继续
      c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
      -- 设置断点
      t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle breakpoint" },
      T = { "<cmd>lua require'dap'.clear_breakpoints()<cr>", "Clear breakpoints" },
      --  stepOver, stepOut, stepInto
      j = { "<cmd>lua require'dap'.step_over()<cr>", "Step over" },
      k = { "<cmd>lua require'dap'.step_out()<cr>", "Step out" },
      l = { "<cmd>lua require'dap'.step_into()<cr>", "Step into" },
      -- 弹窗
      h = { "<cmd>lua require'dapui'.eval()<cr>", "DAP UI eval" },
    },
    p = {
      name = "Packer",
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      s = { "<cmd>PackerSync<cr>", "Sync" },
      S = { "<cmd>PackerStatus<cr>", "Status" },
      u = { "<cmd>PackerUpdate<cr>", "Update" },
    },
    g = {
      name = "Git",
      j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
      k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
      l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
      p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
      r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
      R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
      s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
      u = {
        "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
        "Undo Stage Hunk",
      },
      o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
      b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
      C = {
        "<cmd>Telescope git_bcommits<cr>",
        "Checkout commit(for current file)",
      },
      d = {
        "<cmd>Gitsigns diffthis HEAD<cr>",
        "Git Diff",
      },
    },
    l = {
      name = "LSP",
      a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
      d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
      w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
      f = { "<cmd>Format<cr>", "Format" },
      i = { "<cmd>LspInfo<cr>", "Info" },
      I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
      j = {
        "<cmd>Lspsaga diagnostic_jump_next<cr>",
        "Next Diagnostic",
      },
      k = {
        "<cmd>Lspsaga diagnostic_jump_prev<cr>",
        "Prev Diagnostic",
      },
      l = { vim.lsp.codelens.run, "CodeLens Action" },
      p = {
        name = "Peek",
        l = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Show line diagnostic" },
        d = { "<cmd>lua require('lsp.peek').Peek('definition')<cr>", "Definition" },
        t = { "<cmd>lua require('lsp.peek').Peek('typeDefinition')<cr>", "Type Definition" },
        i = { "<cmd>lua require('lsp.peek').Peek('implementation')<cr>", "Implementation" },
      },
      q = { vim.diagnostic.setloclist, "Quickfix" },
      r = { "<cmd>Lspsaga rename<cr>", "Rename" },
      s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
      S = {
        "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
        "Workspace Symbols",
      },
      e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
    },
    f = {
      name = "Find",
      b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
      h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
      M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      R = { "<cmd>Telescope registers<cr>", "Registers" },
      t = { "<cmd>Telescope live_grep<cr>", "Text" },
      k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
      C = { "<cmd>Telescope commands<cr>", "Commands" },
    },
    t = {
      name = "ToggleTerm",
      f = { "<cmd>lua require('plugin-config.toggleterm').toggleF()<cr>", "ToggleTerm float" },
      v = { "<cmd>lua require('plugin-config.toggleterm').toggleV()<cr>", "ToggleTerm vertical" },
      h = { "<cmd>lua require('plugin-config.toggleterm').toggleH()<cr>", "ToggleTerm horizon" },
      g = { "<cmd>lua require('plugin-config.toggleterm').toggleG()<cr>", "ToggleTerm lazygit" },
    },
    T = {
      name = "Treesitter",
      i = { "<cmd>TSConfigInfo<cr>", "Info" },
    },
  },
  vmappings = {
    ["/"] = { "<ESC><CMD>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>", "Comment" },
  },
  tmappings = {
    t = {
      name = "ToggleTerm",
      f = { "<cmd>lua require('plugin-config.toggleterm').toggleF()<cr>", "ToggleTerm float" },
      v = { "<cmd>lua require('plugin-config.toggleterm').toggleV()<cr>", "ToggleTerm vertical" },
      h = { "<cmd>lua require('plugin-config.toggleterm').toggleH()<cr>", "ToggleTerm horizon" },
      g = { "<cmd>lua require('plugin-config.toggleterm').toggleG()<cr>", "ToggleTerm lazygit" },
    },
  },
}

M.setup = function()
  local which_key = require("which-key")

  which_key.setup(M.config.setup)

  local opts = M.config.opts
  local mappings = M.config.mappings
  which_key.register(mappings, opts)

  local vopts = M.config.vopts
  local vmappings = M.config.vmappings
  which_key.register(vmappings, vopts)

  local topts = M.config.topts
  local tmappings = M.config.tmappings
  which_key.register(tmappings, topts)

  if M.config.on_config_done then
    M.config.on_config_done(which_key)
  end
end

return M.setup()
