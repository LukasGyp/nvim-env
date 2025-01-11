return {
  'akinsho/toggleterm.nvim',
  version = '*',
  keys = {
    { "<C-t>", mode = "n" }
  },
  config = function()
    require("toggleterm").setup({
      size = 100,
      open_mapping = [[<C-t>]],
      shell = "pwsh.exe",
      direction = "float",
      persist_mode = true,
    })
  end,
}
