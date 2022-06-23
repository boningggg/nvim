---------- Server Config ----------
local servers = {
  clangd = require("lsp.clangd"), -- for C
  jdtls = require("lsp.jdtls"), -- for Java
  rust_analyzer = require("lsp.rust_analyzer"), -- for rust
}

for name, opts in pairs(servers) do
  opts.on_attach = require("keymappings").lsp_keymapping
  opts.capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
  require("lspconfig")[name].setup(opts)
end

---------- Lsp Floating Window Config ----------
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

local signs = {
  DiagnosticSignError = "",
  DiagnosticSignWarn = "",
  DiagnosticSignHint = "",
  DiagnosticSignInfo = "",
}

for hl, icon in pairs(signs) do
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  update_in_insert = true,
  severity_sort = true,
  float = {
    header = "",
    border = "rounded",
  },
})
