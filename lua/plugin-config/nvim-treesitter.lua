local ok_treesitter, treesitter = pcall(require, "nvim-treesitter.configs")

if not ok_treesitter then
  vim.notify("[ERROR] Don't find the plugin 'nvim-treesitter', please check 'plugins.lua'.")
  return
end

treesitter.setup({
  ensure_installed = "all",
  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,
  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
