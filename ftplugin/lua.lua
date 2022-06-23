vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
-- Disable auto-comment after enter <CR> key or o key
vim.opt_local.formatoptions = vim.opt_local.formatoptions - { "c", "r", "o" }
