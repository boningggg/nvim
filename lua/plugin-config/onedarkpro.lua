local ok, onedarkpro = pcall(require, "onedarkpro")

if not ok then
  vim.notify("[ERROR] Don't find the plugin onedarkpro.")
  return
end

onedarkpro.setup({
  -- This enables the Neovim background to set either onedark or onelight
  theme = function()
    if vim.o.background == "dark" then
      return "onedark"
    else
      return "onelight"
    end
  end,
  colors = {}, -- Override default colors
  hlgroups = {}, -- Override default highlight groups
  filetype_hlgroups = {}, -- Override default highlight groups for specific filetypes
  filetype_hlgroups_ignore = { -- Filetypes which are ignored when applying filetype highlight groups
    filetypes = {
      "^aerial$",
      "^alpha$",
      "^fugitive$",
      "^fugitiveblame$",
      "^help$",
      "^minimap$",
      "^NvimTree$",
      "^packer$",
      "^qf$",
      "^startify$",
      "^startuptime$",
      "^terminal$",
      "^toggleterm$",
      "^undotree$",
    },
    buftypes = { "^terminal$" },
  },
  plugins = { -- Enable/Disable specific plugins
    aerial = true,
    barbar = true,
    dashboard = true,
    gitsigns_nvim = true,
    hop = true,
    indentline = true,
    lsp_saga = true,
    marks = true,
    native_lsp = true,
    neo_tree = true,
    notify = true,
    nvim_cmp = true,
    nvim_dap = true,
    nvim_dap_ui = true,
    nvim_hlslens = true,
    nvim_tree = true,
    nvim_ts_rainbow = true,
    packer = true,
    polygot = true,
    startify = true,
    telescope = true,
    toggleterm = true,
    treesitter = true,
    trouble_nvim = true,
    vim_ultest = true,
    which_key_nvim = true,
  },
  styles = {
    strings = "NONE", -- Style that is applied to strings
    comments = "italic", -- Style that is applied to comments
    keywords = "NONE", -- Style that is applied to keywords
    functions = "NONE", -- Style that is applied to functions
    variables = "NONE", -- Style that is applied to variables
  },
  options = {
    bold = false, -- Use the themes opinionated bold styles?
    italic = false, -- Use the themes opinionated italic styles?
    underline = false, -- Use the themes opinionated underline styles?
    undercurl = false, -- Use the themes opinionated undercurl styles?
    cursorline = true, -- Use cursorline highlighting?
    transparency = true, -- Use a transparent background?
    terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
    window_unfocussed_color = false, -- When the window is out of focus, change the normal background?
  },
})

onedarkpro.load()
