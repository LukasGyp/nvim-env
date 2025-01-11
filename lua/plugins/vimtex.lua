return {
  'lervag/vimtex',
  lazy = false,
  tag = 'v2.15',
  init = function()
    vim.g.vimtex_view_method = 'general'
    vim.g.vimtex_view_general_viewer = 'cmd.exe'
    vim.g.vimtex_view_general_options = '/c start "" /B sioyek @pdf'

    vim.g.vimtex_view_forward_search_on_start = 1

    vim.o.conceallevel = 2
    vim.g.tex_conceal = "abdmg"
  end,
}
