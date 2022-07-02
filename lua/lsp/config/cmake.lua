return {
  on_setup = function(server)
    server.setup({
      capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    })
  end,
}
