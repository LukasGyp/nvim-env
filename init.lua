require("config.keymaps")
require("config.options")
require("config.lazy")

require("catppuccin").setup({
  flavour = "auto",
})
vim.cmd.colorscheme "catppuccin"

require'nvim-treesitter.configs'.setup{
  indent = {
    enable = true
  }
}
require("lualine").setup()

require("toggleterm").setup({
  size = 100,
  open_mapping = [[<C-t>]],
  shell = "pwsh.exe",
  direction = "float",
  persist_mode = true,
})

require("mason").setup()
require'lspconfig'.pylsp.setup{}
require'lspconfig'.rust_analyzer.setup{
  on_attach = function(client, bufnr)
    vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
  end,
  settings = {
    ["rust-analyzer"] = {
      imports = {
	granularity = {
	  group = "module",
	},
	prefix = "self",
      },
      cargo = {
	buildScripts = {
	  enable = true,
	},
      },
      procMacro = {
	enable = true,
      },
    }
  }
  
}

require("cmp").setup({
})
