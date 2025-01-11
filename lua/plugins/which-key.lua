return {
  'folke/which-key.nvim',
  cmd = {
    "WhichKey",
  },
  opts = {
    -- your configuration here
  },
  keys = {
    {
      '<leader>?',
      function()
	require('which-key').show({ global = false })
      end,
      desc = 'Buffer Local Keymaps (which-key)',
    },
  },
}
