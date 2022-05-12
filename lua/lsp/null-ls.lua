local status, null_ls = pcall(require, "null-ls")
if not status then
  vim.notify("没有找到 null-ls")
  return
end

-- local formatting = null_ls.builtins.formatting
-- local diagnostics = null_ls.builtins.diagnostics
-- local code_actions = null_ls.builtins.code_actions

null_ls.setup({
  debug = false,
  on_attach = function(_)
    vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()']])
    -- if client.resolved_capabilities.document_formatting then
    --   vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    -- end
  end,
})
