local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s('init', {
    t({
      '\\documentclass{article}',
      '\\begin{document}',
      '',
    }), i(1),
    t({
      '',
      '\\end{document}',
    }),
  }),
}
