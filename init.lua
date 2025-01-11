require("config.keymaps")
require("config.options")
require("config.lazy")

require("catppuccin").setup({
  flavour = "auto",
})
vim.cmd.colorscheme "catppuccin"

