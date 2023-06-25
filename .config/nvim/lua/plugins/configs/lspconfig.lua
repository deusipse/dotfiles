local present, lspconfig = pcall(require, "lspconfig")
if not present then
  return
end

local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<Leader>ra', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<Leader>F', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<space>lf', function() vim.lsp.buf.format { async = true } end, bufopts)
  vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next({ float = { border = "rounded" }}) end, bufopts)
  vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev({ float = { border = "rounded" }}) end, bufopts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local servers = { "pyright", "clangd", "texlab" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
