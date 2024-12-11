return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  event = { 'VeryLazy' },

  dependencies = {
    'nvim-lua/plenary.nvim',
    "nvim-telescope/telescope-frecency.nvim",
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-ui-select.nvim',
  },

  config = function()
    local telescope = require('telescope')
    local map = vim.keymap.set
    local builtin = require 'telescope.builtin'

    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['<esc>'] = require('telescope.actions').close,
          }
        },
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

    telescope.load_extension('fzf')
    telescope.load_extension('ui-select')
    telescope.load_extension "frecency"

    map('n', '<Space>b', builtin.buffers, { desc = '[B]uffers' })
    map('n', '<Space>i', builtin.current_buffer_fuzzy_find, { desc = 'Find In Buffer'})

    map('n', '<Space>d', function()
      builtin.find_files { cwd = '%:h' }
    end, { desc = 'Find in CW[D]' })

    map('n', '<Space>g', builtin.git_status, { desc = '[G]it Status Files' })

    map('n', '<Space>r', '<cmd>Telescope frecency workspace=CWD<cr>', { desc = '[R]ecent files' })

    map('n', '<Space>t', builtin.find_files, { desc = '[T]o Files' })

    map('n', '<Space>f', function()
      local word = vim.fn.expand '<cword>'
      builtin.grep_string { search = word }
    end, { desc = '[F]ind Word' })

    map('x', '<Space>f', function()
      vim.cmd 'normal! y'
      local visual_text = vim.fn.getreg ''
      builtin.grep_string { search = visual_text }
    end, { desc = '[F]ind Visual Selection' })

    map('n', '<Space>h', builtin.help_tags, { desc = '[H]elp' })

    map('n', '<Space>j', function()
      builtin.grep_string { search = vim.fn.input 'grep ❯ ' }
    end, { desc = 'Find in Pro[j]ect' })

    map('n', '<Space>u', function()
      builtin.resume()
    end, { desc = 'Res[u]me' })
  end,

  cond = vim.fn.exists('g:vscode') == 0
}
