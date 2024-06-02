require('telescope').setup({
  defaults = {
    layout_strategy = 'vertical',
    layout_config = {
      preview_cutoff = 40,
      vertical = { width = 0.9, height = 0.9, preview_height = 0.6 },
    },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden',
      '--glob', '!**/.git/*',
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
})
