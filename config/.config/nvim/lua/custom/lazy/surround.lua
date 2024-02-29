return {
  'echasnovski/mini.surround',
  version = '*',

  config = function()
    require('mini.surround').setup({
      custom_surroundings = {
        ['('] = { output = { left = '( ', right = ' )' } },
        ['['] = { output = { left = '[ ', right = ' ]' } },
        ['{'] = { output = { left = '{ ', right = ' }' } },
        ['<'] = { output = { left = '< ', right = ' >' } },
      },
      mappings = {
        add = 'ys',
        delete = 'ds',
        find = '',
        find_left = '',
        highlight = '',
        replace = 'cs',
        update_n_lines = '',
      },
      search_method = 'cover_or_next',
    })

    vim.api.nvim_set_keymap('x', 'S', [[:<C-u>lua MiniSurround.add('visual')<CR>]], { noremap = true })
    vim.api.nvim_set_keymap('n', 'yss', 'ys_', { noremap = false })
  end
}
