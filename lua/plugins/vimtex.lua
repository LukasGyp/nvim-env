return {
  'lervag/vimtex',
  tag = 'v2.15',
  ft = {
    "tex",
  },
  init = function()
    vim.g.vimtex_view_method = 'general'
    vim.g.vimtex_view_general_viewer = 'sioyek'
    vim.g.vimtex_view_general_options = '@pdf'

    vim.g.vimtex_view_forward_search_on_start = 1

    vim.o.conceallevel = 2
    vim.g.tex_conceal = "abdmg"
  end,
  option = function()
    require("vimtex").setup()
  end,
}
