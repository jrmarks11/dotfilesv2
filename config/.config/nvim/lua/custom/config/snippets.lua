local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local elixir_snippets = {
  s('p', { t '|> ', i(0) }),
  s('fn', { t 'fn ', i(1, 'params'), t ' -> ', i(0), t ' end' }),
  s('ok', { t '{:ok, ', i(1), t ' }' }),
  s('err', { t '{:error, ', i(1), t ' }' }),
}

local lua_snippets = {
  ls.s('mf', {
    ls.t 'function M.',
    ls.i(1),
    ls.t '(',
    ls.i(2),
    ls.t ')',
    ls.t { '', '\t' },
    ls.i(0),
    ls.t { '', 'end' },
  }),

  ls.s('m', {
    ls.t 'local M = {}',
    ls.t { '', '' },
    ls.i(0),
    ls.t { '', 'return M' },
  }),
}

ls.add_snippets('elixir', elixir_snippets)
ls.add_snippets('lua', lua_snippets)
