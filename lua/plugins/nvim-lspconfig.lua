return {
  'neovim/nvim-lspconfig',
  ft = {
    "python",
    "rust",
  },
  config = function()
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
    require'lspconfig'.clangd.setup{}
  end,
}
