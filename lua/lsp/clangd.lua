local home = vim.fn.getenv("HOME")

return {
  cmd = {
    home .. "/.local/share/nvim/lsp_servers/clangd/clangd/bin/clangd",
  },
}
