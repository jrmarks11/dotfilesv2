return {
  'echasnovski/mini.nvim',
  version = false,
  event = 'VeryLazy',

  config = function()
    require('mini.ai').setup {
      mappings = {
        around_next = '',
        inside_next = '',
        around_last = '',
        inside_last = '',
        goto_left = '',
        goto_right = '',
      },
    }

    require('mini.indentscope').setup {
      draw = {
        animation = require('mini.indentscope').gen_animation.none(),
      },
    }

    require('mini.splitjoin').setup {
      mappings = {
        toggle = '',
      },
    }

    local sl = require 'mini.statusline'
    sl.setup {
      content = {
        active = function()
          local mode, mode_hl = sl.section_mode { trunc_width = 120 }
          local filename = sl.section_filename { trunc_width = 140 }
          local marks = require('util.visits').section_marked_files()
          local location = '%2l:%-2v'

          return sl.combine_groups {
            { hl = mode_hl, strings = { mode } },
            '%<',
            { hl = 'slFilename', strings = { filename } },
            '%=',
            { hl = 'slFilename', strings = { marks } },
            { hl = mode_hl, strings = { location } },
          }
        end,

        inactive = function()
          local filename = sl.section_filename { trunc_width = 140 }
          local location = '%2l:%-2v'

          return sl.combine_groups {
            '%<',
            { hl = 'slFilename', strings = { filename } },
            '%=',
            { hl = 'slInactive', strings = { location } },
          }
        end,
      },
    }

    require('mini.surround').setup {
      mappings = {
        find = '',
        find_left = '',
        highlight = '',
        update_n_lines = '',
        suffix_last = '',
        suffix_next = '',
      },
    }

    require('mini.visits').setup()

    require 'custom.keybindings.mini'
  end,
}
