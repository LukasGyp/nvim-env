return {
  'akinsho/toggleterm.nvim',
  version = '*',
  keys = {
    { "<C-t>", mode = "n" }
  },
  config = function()
    local shell = os.getenv("TOGGLETERM_SHELL")
    require("toggleterm").setup({
      size = 100,
      open_mapping = [[<C-t>]],
      shell = shell,
      direction = "float",
      persist_mode = true,
    })
  end,
}
