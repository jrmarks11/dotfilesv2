require('telescope').setup {
  defaults = {
    layout_strategy = 'vertical',
    layout_config = {
      prompt_position = 'top',
      height = 0.9,
      preview_cutoff = 40,
      bottom_pane = {
        height = 0.6,
        prompt_position = 'top',
        preview_height = 0.6,
      },
    },
    sorting_strategy = 'ascending',
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden',
      '--glob',
      '!**/.git/*',
    },
  },
  extensions = {
    recent_files = {
      only_cwd = true,
    },
    ['ui-select'] = {
      require('telescope.themes').get_dropdown(),
    },
  },
  pickers = {
    find_files = {
      find_command = { 'rg', '--files', '--hidden', '--glob', '!**/.git/*' },
    },
  },
}
