local ok, nvim_tree = pcall(require, "nvim-tree")

if not ok then
  vim.notify("[ERROR] Don't find the plugin nvim-tree.")
  return
end

local nvim_tree_keymapping = require("keymappings").nvim_tree_keymapping

nvim_tree.setup({
  view = {
    mappings = {
      custom_only = true,
      list = nvim_tree_keymapping,
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
})
