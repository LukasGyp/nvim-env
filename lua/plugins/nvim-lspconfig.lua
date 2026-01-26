return {
  'neovim/nvim-lspconfig',
  ft = {
    "c",
    "cpp",
    "python",
    "rust",
  },
  config = function()
    vim.lsp.config('basedpyright', {
      basedpyright = {
	analysis = {
	  typeCheckingMode = "standard",
	  autoSearchPaths = true,
	  useLibraryCodeForTypes = true,
	  diagnosticMode = "openFilesOnly",
	},
      },
    })
    vim.lsp.enable('basedpyright')

    vim.lsp.config('ruff', {
      capabilities = {
	general = {positionEncodings = {"utf-16"}},
      },
      on_attach = function(client, bufnr)
	client.server_capabilities.hoverProvider = false
      end,
    })
    vim.lsp.enable('ruff')
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.py",
      callback = function()
	vim.lsp.buf.format({async = false})
	vim.cmd("LspRestart ruff")
      end,
    })
    
    vim.lsp.config('rust_analyzer', {
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
    })
    vim.lsp.enable('rust_analyzer')

    vim.lsp.config('clangd', {})
    vim.lsp.enable('clangd')
  end,
}
