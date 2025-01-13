local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local environments = {
  'equation',
  'equation*',
  'align',
  'dfn',
  'thm',
  'lem',
  'prop',
  'cor',
  'rem',
  'ex',
  'pmatrix',
  'proof',
}

local snips = {
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

for _, env_name in pairs(environments) do
  table.insert(snips, s('\\'..env_name, {
    t({
      '\\begin{' .. env_name .. '}',
      '  ',
    }), i(1),
    t({
      '',
      '\\end{' .. env_name .. '}',
    })
  }))
end

return snips
