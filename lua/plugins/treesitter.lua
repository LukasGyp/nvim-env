return {
  "nvim-treesitter/nvim-treesitter",
  event = {
    'BufNewFile',
    'BufRead'
  },
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
	"python",
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = false },
    })
  end,
}
