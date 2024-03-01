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
        add = 'sa',
        delete = 'sd',
        find = 'sf',
        find_left = 'sF',
        highlight = '',
        replace = 'sr',
        update_n_lines = '',
      },
      search_method = 'cover_or_next',
    })
  end
}
