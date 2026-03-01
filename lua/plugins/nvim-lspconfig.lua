return {
  'neovim/nvim-lspconfig',
  event = {
    "BufReadPre",
    "BufNewFile"
  },
  config = function()
    local servers = {
      "basedpyright",
      "clangd",
      "eslint",
      "ruff",
      "rust_analyzer",
      "texlab",
      "tinymist",
      "ts_ls",
    }
    vim.lsp.enable(servers)

    -- nvim-lspconfig.lua (or wherever you configure LSP)
    -- Put this somewhere that is guaranteed to run (plugin config).

    local function map(bufnr, mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
    end

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspKeymaps", { clear = true }),
      callback = function(args)
	local bufnr = args.buf
	local client = vim.lsp.get_client_by_id(args.data.client_id)

	-- ========== Core navigation ==========
	map(bufnr, "n", "gd", vim.lsp.buf.definition, "LSP: Go to definition")
	map(bufnr, "n", "gD", vim.lsp.buf.declaration, "LSP: Go to declaration")
	map(bufnr, "n", "gi", vim.lsp.buf.implementation, "LSP: Go to implementation")
	map(bufnr, "n", "gr", vim.lsp.buf.references, "LSP: References")
	map(bufnr, "n", "gy", vim.lsp.buf.type_definition, "LSP: Type definition")

	-- ========== Hover / signature ==========
	-- Note: if you disable hoverProvider on some clients (e.g. ruff),
	-- another client (e.g. pyright) will handle it.
	map(bufnr, "n", "K", vim.lsp.buf.hover, "LSP: Hover docs")
	map(bufnr, "n", "<C-k>", vim.lsp.buf.signature_help, "LSP: Signature help")

	-- ========== Code actions / rename ==========
	map(bufnr, "n", "<leader>rn", vim.lsp.buf.rename, "LSP: Rename symbol")
	map(bufnr, { "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "LSP: Code action")

	-- ========== Diagnostics ==========
	map(bufnr, "n", "<leader>e", vim.diagnostic.open_float, "Diag: Show line diagnostics")
	map(bufnr, "n", "[d", vim.diagnostic.goto_prev, "Diag: Prev diagnostic")
	map(bufnr, "n", "]d", vim.diagnostic.goto_next, "Diag: Next diagnostic")
	map(bufnr, "n", "<leader>q", vim.diagnostic.setloclist, "Diag: Diagnostics to loclist")

	-- Optional: quick diagnostic list
	-- map(bufnr, "n", "<leader>Q", vim.diagnostic.setqflist, "Diag: Diagnostics to quickfix")

	-- ========== Formatting ==========
	-- If you already do format-on-save (like ruff only), keep this as a manual format.
	map(bufnr, "n", "<leader>lf", function()
	  vim.lsp.buf.format({ async = true })
	end, "LSP: Format buffer")

	-- ========== Workspace ==========
	map(bufnr, "n", "<leader>wa", vim.lsp.buf.add_workspace_folder, "LSP: Add workspace folder")
	map(bufnr, "n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, "LSP: Remove workspace folder")
	map(bufnr, "n", "<leader>wl", function()
	  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, "LSP: List workspace folders")

	-- ========== LSP info/debug ==========
	map(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", "LSP: Info")
	map(bufnr, "n", "<leader>ll", function()
	  local name = client and client.name or "?"
	  print("LSP client: " .. name)
	end, "LSP: Print client name")
      end,
    })

  end,
}
