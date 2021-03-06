local opts = {
  capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  flags = {
    debounce_text_changes = 150,
  },
  cmd = {
    "clangd",
    "-pretty",
    "-log=verbose",
    "--clang-tidy",
    "--background-index",
    "--pch-storage=memory",
    "--header-insertion=never",
    "--completion-style=detailed",
  },
  on_attach = function(client, bufnr)
    -- 禁用格式化功能，交给专门插件插件处理
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    -- 绑定快捷键
    require("keybindings").map_lsp(buf_set_keymap)
  end,
}

return {
  on_setup = function(server)
    server.setup(opts)
  end,
}
