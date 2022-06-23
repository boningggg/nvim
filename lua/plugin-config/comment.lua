local keymappings = require("keymappings")

require("Comment").setup({
  toggler = keymappings.comment.toggler,
  opleader = keymappings.comment.opleader,
  mappings = {
    ---Includes `gcc`, `gbc`, `gc[count]{motion}` and `gb[count]{motion}`
    ---NOTE: These mappings can be changed individually by `opleader` and `toggler` config
    basic = true,
    extra = false,
    extended = false,
  },
})
