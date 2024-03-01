return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',

  dependencies = {
    'nvim-lua/plenary.nvim',
    'smartpde/telescope-recent-files',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-ui-select.nvim',
  },

  config = function()
    local telescope = require('telescope')

    telescope.setup({
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

    telescope.load_extension('fzf')
    telescope.load_extension('ui-select')
    telescope.load_extension('recent_files')

    local map = vim.keymap.set
    local recent_files = telescope.extensions.recent_files
    local builtin = require('telescope.builtin')

    map('n', '<Space>d', function() builtin.find_files({ cwd = '%:h' }) end)
    map('n', '<Space>g', builtin.git_status)
    map('n', '<Space>i', builtin.highlights)
    map('n', '<Space>r', function() recent_files.pick() end)
    map('n', '<Space>t', builtin.find_files)

    map('n', '<Space>f', function()
      local word = vim.fn.expand('<cword>')
      builtin.grep_string({ search = word })
    end)

    map('x', '<Space>f', function()
      vim.cmd('normal! y')
      local visual_text = vim.fn.getreg('')
      builtin.grep_string({ search = visual_text })
    end)

    map('n', '<Space>h', function()
      local word = vim.fn.expand('<cword>')
      builtin.help_tags({ default_text = word })
    end)

    map('n', '<Space>j', function()
      builtin.grep_string({ search = vim.fn.input('grep ❯ ') })
    end)
  end,
  cond = vim.fn.exists('g:vscode') == 0
}
