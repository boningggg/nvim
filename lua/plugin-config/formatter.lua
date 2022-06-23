local ok, formatter = pcall(require, "formatter")

if not ok then
  vim.notify("[ERROR] Don't find the plugin formatter.")
  return
end

local cpp_style = {
  function()
    return {
      exe = "clang-format",
      args = {
        "--assume-filename=" .. vim.fn.expand("%:t"),
        "-style='{\
              BasedOnStyle: LLVM, \
              IndentWidth: 8, \
              UseTab: Always, \
              IncludeBlocks: Regroup, \
              BreakBeforeBraces: Linux, \
              AlignConsecutiveDeclarations: true, \
              AlignConsecutiveAssignments: true}'",
      },
      stdin = true,
    }
  end,
}

require("formatter").setup({
  filetype = {
    c = cpp_style,
    cpp = cpp_style,
    java = {
      function()
        return {
          exe = "clang-format",
          args = {
            "--assume-filename=" .. vim.fn.expand("%:t"),
            "-style='{\
              BasedOnStyle: LLVM, \
              IndentWidth: 4, \
              AlignAfterOpenBracket: Align, \
              AlignConsecutiveDeclarations: true, \
              AlignConsecutiveAssignments: true}'",
          },
          stdin = true,
        }
      end,
    },
    lua = {
      function()
        return {
          exe = "stylua",
          args = {
            "--config-path " .. vim.fn.getenv("HOME") .. "/.config/nvim/lua/plugin-config/stylua.toml",
            "-",
          },
          stdin = true,
        }
      end,
    },
    rust = {
      function()
        return {
          exe = "rustfmt",
          stdin = true,
        }
      end,
    },
  },
})
