return {
  'tpope/vim-projectionist',
  ft = { 'elixir' },

  config = function()
    vim.keymap.set({ 'n', 'x' }, '<space>a', ':A<CR>', { silent = true, desc = 'Go To Alternate File' })

    vim.g.projectionist_heuristics = {
      ['mix.exs'] = {
        ['lib/*.ex'] = {
          ['type'] = 'lib',
          ['alternate'] = 'test/{}_test.exs',
          ['template'] = {
            'defmodule {camelcase|capitalize|dot} do',
            'end',
          },
        },
        ['test/*_test.exs'] = {
          ['type'] = 'test',
          ['alternate'] = 'lib/{}.ex',
          ['template'] = {
            'defmodule {camelcase|capitalize|dot}Test do',
            '  use Bitfreighter.DataCase, async: true',
            '',
            '  alias {camelcase|capitalize|dot}',
            'end',
          },
        },
      },
    }
  end,

  cond = vim.fn.exists 'g:vscode' == 0,
}
