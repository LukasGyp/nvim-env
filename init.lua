-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("toggleterm").setup({
  size = 100,
  open_mapping = [[<c-\>]],
  shell = "pwsh.exe",
  direction = "float",
  persist_mode = true,
})
