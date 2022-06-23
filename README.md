# Neovim Config

Basic config with some necessary plugins.

The basic features I need:

- [x] Plugin Manager
- [x] Syntax highlighting
- [x] Colorscheme
- [x] File explorer
- [x] Tabline
- [x] Statusline
- [x] Search
- [x] Fuzzy Finder
- [x] Terminal Integration
- [x] Custom indent for file type
- [x] Format
- [x] Keymappings Prompt
- [x] Language Server Protocol
- [x] Completion
- [x] Debug

## Folder structure

```
~/.config/nvim
├── README.md
├── ftplugin
│   └── xxx.lua
├── init.lua
├── lua
│   ├── basic.lua
│   ├── keymappings.lua
│   ├── plugin-config
│   │   └── xxx.lua
│   └── plugins.lua
└── plugin
    └── packer_compiled.lua
```

## Plugin Manager

[wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim) - A use-package inspired plugin manager for Neovim, written in lua.

1. Installation

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

2. Write `plugins.lua`.

3. `require("plugins")` in `init.lua`.

4. `:w` to `:PackerSync`

## Syntax highlighting

[nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - The goal of `nvim-treesitter` is both to provide a simple and easy way to use the interface for [tree-sitter](https://github.com/tree-sitter/tree-sitter) in Neovim and to provide some basic functionality such as highlighting based on it.

1. Installation

​	See `plugins.lua`

2. Write configuration `nvim-treesitter.lua`

## Colorscheme

[olimorris/onedarkpro.nvim](https://github.com/olimorris/onedarkpro.nvim) - OneDarkPro theme for Neovim. Completely customisable colors, styles and highlights. Written in Lua.

1. Installation

   See `plugins.lua`

2. Write configuration of this scheme in `onedarkpro.lua`

## File explorer

[kyazdani42/nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua) - A simple and fast file explorer tree for Neovim !

### Requirement

[nerd font](https://link.zhihu.com/?target=https%3A//www.nerdfonts.com/)

Install your favorite font following this [nerd_fonts.sh](https://gist.github.com/davidteren/898f2dcccd42d9f8680ec69a3a5d350e). Then change your terminal font.

1. Installation

   See `plugins.lua`

2. Write configuration `nvim-tree.lua`

3. Write the key-mappings of this plugin in `keymappings.lua`

## Tabline

[akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim) - A snazzy buffer line for Neovim built using Lua.

1. Installation

   See `plugins.lua`

2. Write configuration `bufferline.lua`

3. Write the key-mappings of this plugin in `keymappings.lua`

> [BUG] When there are [nvim tree], [tab 1] and [tab 2], closing [tab 1] using `:bdelete` will show [nvim tree] not [tab 2]!

## Statusline

[nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - A blazing fast and easy to configure Neovim statusline.

1. Installation

   See `plugins.lua`

2. Write configuration `lualine.lua`

## Search

[rktjmp/highlight-current-n.nivm](https://github.com/rktjmp/highlight-current-n.nvim) - Highlights the current /, ? or * match under your cursor when pressing n or N and gets out of the way afterwards.

1. Installation

   See `plugins.lua`

2. Write configuration `highlight-current-n.lua`
3. Write the key-mappings of this plugin in `keymappings.lua`

## Fuzzy Finder

[nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Telescope.nvim is a highly [extendable](https://github.com/nvim-telescope/telescope.nvim/wiki/Extensions) fuzzy finder over lists. Built on the latest awesome features from Neovim core. Telescope is centered around modularity, allowing for easy customization.

### Requirement 

- [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep) is required for `live_grep` and `grep_string`
- [sharkdp/fd](https://github.com/sharkdp/fd) (finder)

Use `brew` to install them.

1. Installation

   See `plugins.lua`

2. Write the key-mappings of this plugin in `keymappings.lua`

## Terminal Integration

[akinsho/nvim-toggleterm.lua](https://github.com/akinsho/nvim-toggleterm.lua) - A Neovim Lua plugin to help easily manage multiple terminal windows.

1. Installation

   See `plugins.lua`

2. Write configuration `toggleterm.lua`
3. Write the key-mappings of this plugin in `keymappings.lua`

## Custom indent for file type

I want to customise different indent according to the file type. 

For example:
The indent style of Lua is 2 spaces. 
The indent style of C is 8 spaces. (Linux style)
So I have to customise the indent style separately.

1. `mkdir ~/.config/nvim/ftplugin` and `cd` to it.

2. Customise different indent style file for different file type. e.g. `lua.lua`

3. Done, the neovim will automatically load this file when you are editing *.lua.

## Format

[mhartington/formatter.nvim](https://github.com/mhartington/formatter.nvim) - A format runner for neovim, written in lua.

1. `brew install clang-format` and `brew install stylua`

2. Installation

   See `plugins.lua`

3. Write configuration `formatter.lua`

4. Write the key-mappings of this plugin in `keymappings.lua`

## Keymappings Prompt

[folke/which-key.nvim](https://github.com/folke/which-key.nvim) - WhichKey is a lua plugin for Neovim 0.5 that displays a popup with possible key bindings of the command you started typing.

1. Installation

   See `plugins.lua`

2. Write configuration `which-key.lua`

## Comment

[numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim) - Smart and Powerful commenting plugin for neovim.

1. Installation

   See `plugins.lua`

2. Write configuration `comment.lua`

## Language Server Protocol

[neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - Quickstart configurations for the Neovim LSP client.

1. Installation

   See `plugins.lua`

2. Write configuration `nvim-lspconfig.lua` and `nvim-lsp-installer.lua`

3. Write configuration for each language e.g. `lsp.jdtls` and `clangd`

4. Write the key-mappings of this plugin in `keymappings.lua`

## Completion

[hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - A completion plugin for Neovim written in Lua. New version of nvim-compe.

1. Installation

   See `plugins.lua`

2. Write configuration `nvim-cmp.lua`
3. Write the key-mappings of this plugin in `keymappings.lua`
4. Add an additional capabilities supported by nvim-cmp in `nvim-lspconfig.lua`

## Debug

[mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap) - Debug Adapter Protocol client implementation for Neovim.

1. Install a debug adapter per language

   The [Debug-Adapter Installation](https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation) wiki

   An easy way to install `lldb-vscode` on Mac is to use `brew`

   ```
   $ brew install llvm
   ```

   Then executable file `lldb-vscode` and `lldb-server` are under this path `/usr/local/Cellar/llvm/13.0.1_1/bin`.

2. Installation

   See `plugins.lua`

3. Write configuration `nvim-dap.lua`,`nvim-dap-ui.lua`

4. Write the key-mappings of plugins `nvim-dap` and `nvim-dap-ui`  in `keymappings.lua`

> ❕load_launchjs({path}, {type_to_filetypes})
> 	 			
>
> ​				{path}    Path to the `launch.json` file. Defaults to`.vscode/launch.json` relative to the working directory.
