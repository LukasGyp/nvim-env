
return {
  'nvim-telescope/telescope.nvim',
  lazy = true,
  cmd = {
    "Telescope",
  },
  keys = {
    "<C-f>",
  },
  tag = '0.1.8',
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'telescope find files' })
    vim.keymap.set('n', '<C-f>', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
  end,
}
