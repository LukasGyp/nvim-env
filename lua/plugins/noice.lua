return {
  'folke/noice.nvim',
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  opts = {},
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  }
}
