return {
  'mason-org/mason-lspconfig.nvim',
  lazy = false,
  config = function()
    require("mason-lspconfig").setup()
  end,
}
