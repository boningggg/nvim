local ok, lualine = pcall(require, "lualine")

if not ok then
  vim.notify("[ERROR] Don't find the plugin lualine.")
  return
end

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false, -- enable global statusline (have a single statusline
    -- at bottom of neovim instead of one for  every window).
    -- This feature is only available in neovim 0.7 and higher.
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { "filename" },
    lualine_x = {
      "filesize",
      {
        "fileformat",
        symbols = {
          unix = "LF",
          dos = "CRLF",
          mac = "CR",
        },
      },
      "encoding",
      "filetype",
    },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  tabline = {},
  extensions = { "nvim-tree", "toggleterm" },
})
