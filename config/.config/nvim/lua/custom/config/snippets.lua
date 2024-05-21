local ls = require 'luasnip' -- Load the LuaSnip package
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local fmt = require('luasnip.extras.fmt').fmt

local elixir_snippets = {
  s('p', { t '|> ', i(0) }),
  s('fn', { t 'fn ', i(1, 'params'), t ' -> ', i(0), t ' end' }),
  s('m', { t '%{', i(0), t '}' }),
  s('ne', { t '=~ ', i(0) }),
  s('ok', { t '{:ok, ', i(1), t ' }' }),
  s('err', { t '{:error, ', i(1), t ' }' }),

  s(
    'test',
    fmt('test "{}", %{{context: con}} do\n  {}\nend', {
      i(1, 'name'),
      i(0, '# test'),
    })
  ),
  s(
    'desc',
    fmt('describe "{}" do\n  {}\nend', {
      i(1, 'test group subject'),
      i(0, '# description'),
    })
  ),
  s(
    'def',
    fmt('def {}({}) do\n  {}\nend', {
      i(1, 'name'),
      i(2, 'params'),
      i(0, '# function'),
    })
  ),
  s(
    'defp',
    fmt('defp {}({}) do\n  {}\nend', {
      i(1, 'name'),
      i(2, 'params'),
      i(0, '# function'),
    })
  ),
}

local lua_snippets = {
  ls.s('f', {
    ls.t 'local function ',
    ls.i(1),
    ls.t '(',
    ls.i(2),
    ls.t ')',
    ls.t { '', '\t' },
    ls.i(0),
    ls.t { '', 'end' },
  }),

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
