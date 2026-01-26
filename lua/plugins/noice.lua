return {
  'folke/noice.nvim',
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  opts = {
    lsp = {
      signature = {
	enabled = false,
      },
    },
  },
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  }
}
