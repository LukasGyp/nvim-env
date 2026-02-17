return {
  'mason-org/mason-lspconfig.nvim',
  lazy = false,
  dependencies = {
    'williamboman/mason.nvim',
  },
  config = function()
    require("mason-lspconfig").setup()
  end,
}
