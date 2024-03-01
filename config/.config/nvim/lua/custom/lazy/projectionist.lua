return {
  'tpope/vim-projectionist',

  config = function()
    vim.keymap.set('n', '<Space>a', ':A<CR>', { silent = true })

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
        ['lib/*.ex'] = { ['type'] = 'lib', ['alternate'] = 'test/{}_test.exs', },
        ['test/*_test.exs'] = { ['type'] = 'test', ['alternate'] = 'lib/{}.ex', },
      }
    }
  end,
  cond = vim.fn.exists('g:vscode') == 0
}
