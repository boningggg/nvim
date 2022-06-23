-- UTF-8
vim.o.fileencoding = "UTF-8"
-- Enables 24-bit RGB color
vim.o.termguicolors = true
-- Relative line number
vim.o.number = true
vim.o.relativenumber = true
-- Highlight cursor line
vim.o.cursorline = true
-- Not wrap line
vim.o.wrap = false
-- Show (partial) command in the last line of the screen.
vim.o.showcmd = true
-- enable loading the plugin files for specific file types
vim.o.filetype = "plugin"
-- Ignore cae in search patterns
vim.o.ignorecase = true
-- Enables mouse support
vim.o.mouse = "a"
-- Time in milliseconds to wait for a mapped sequence to complete
vim.o.timeoutlen = 500
-- List mode: By default, show tabs as ">", trailing spaces as "-", and non-breakable space characters as "+".
vim.o.list = true
vim.o.listchars = "tab:→ ,eol:↲,nbsp:␣,trail:•,extends:❯,precedes:❮"
vim.o.showbreak = "↪"
vim.o.background = "light"
