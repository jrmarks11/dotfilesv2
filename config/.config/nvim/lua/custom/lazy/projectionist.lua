return {
  'tpope/vim-projectionist',
  event = 'VeryLazy',

  config = function()
    vim.keymap.set('n', '<space>a', ':A<CR>', { silent = true, desc = 'Go To Alternate File' })

    vim.g.projectionist_heuristics = {
      ['config/routes.rb'] = {
        ['app/models/*.rb'] = {
          ['type'] = 'lib',
          ['alternate'] = 'spec/models/{}_spec.rb',
        },
        ['spec/*_spec.rb'] = {
          ['type'] = 'spec',
          ['alternate'] = 'app/{}.rb',
        },
        ['app/views/*.html.erb'] = {
          ['type'] = 'view',
          ['alternate'] = 'app/controllers/{dirname}_controller.rb',
        },
      },

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
}
