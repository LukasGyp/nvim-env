return {
  'neovim/nvim-lspconfig',
  ft = {
    "c",
    "cpp",
    "python",
    "rust",
    "typescript",
    "typescriptreact",
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

    local caps = vim.lsp.protocol.make_client_capabilities()
    caps.general = caps.general or {}
    caps.general.positionEncodings = {"utf-16"}

    vim.lsp.config('ruff', {
      capabilities = caps,
      on_attach = function(client, bufnr)
	client.server_capabilities.hoverProvider = false
      end,
    })
    vim.lsp.enable('ruff')
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.py",
      callback = function(args)
	vim.lsp.buf.format({
	  bufnr = args.buf,
	  async = false,
	  filter = function(client)
	    return client.name == "ruff"
	  end,
	})
      end,
    })
    
    vim.lsp.config('rust_analyzer', {
      on_attach = function(client, bufnr)
	vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
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

    vim.lsp.config('clangd', {
      cmd = {"clangd", "--compile-commands-dir=."},
    })
    vim.lsp.enable('clangd')

    vim.lsp.config('ts_ls', {
      capabilities = capabilities,
      init_options = {
	preferences = {
	  importModuleSpecifierPreference = "non-relative",
	},
      },
      on_attach = function(client, bufnr)
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false
      end,
    })
    vim.lsp.enable('ts_ls')

    vim.lsp.config('eslint', {
      capabilities = capabilities,
      on_attach= function(client, bufnr)
	vim.api.nvim_create_autocmd("BufWritePre", {
	  buffer = bufnr,
	  command = "EslintFixAll",
	}) 
      end,
    })
    vim.lsp.enable('eslint')
  end,
}
