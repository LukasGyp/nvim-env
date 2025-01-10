return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
  },
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      mapping = cmp.mapping.preset.insert({
	["<C-b>"] = cmp.mapping.scroll_docs(-4),
	["<C-f>"] = cmp.mapping.scroll_docs(4),
	["<C-Space>"] = cmp.mapping.complete(),
	["<C-e>"] = cmp.mapping.close(),
	["<CR>"] = cmp.mapping(function(fallback)
	  if cmp.visible() then
	    if luasnip.expandable() then
	      luasnip.expand()
	    else
	      cmp.confirm({ select = true })
	    end
	  else
	    fallback()
	  end
	end),
	["<Tab>"] = cmp.mapping(function(fallback)
	  if cmp.visible() then
	    cmp.select_next_item()
	  elseif luasnip.locally_jumpable(1) then
	    luasnip.jump(1)
	  else
	    fallback()
	  end
	end, { "i", "s" }),
	["<S-Tab>"] = cmp.mapping(function(fallback)
	  if cmp.visible() then
	    cmp.select_prev_item()
	  elseif luasnip.locally_jumpable(-1) then
	    luasnip.jump(-1)
	  else
	    fallback()
	  end
	end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
	{ name = "buffer" },
	{ name = "path"},
        { name = 'vimtex', },
      }),
    })
    cmp.setup.filetype('tex', {
      mapping = cmp.mapping.preset.insert({
	["<C-b>"] = cmp.mapping.scroll_docs(-4),
	["<C-f>"] = cmp.mapping.scroll_docs(4),
	["<C-Space>"] = cmp.mapping.complete(),
	["<C-e>"] = cmp.mapping.close(),
	["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
	{ name = "buffer" },
	{ name = "path"},
        { name = 'vimtex', },
      }),
      completion = {
	keyword_pattern = [[\\]],
	keyword_length = 1,
      },
    })
  end,
}
