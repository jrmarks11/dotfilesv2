return {
  'echasnovski/mini.nvim',
  version = false,
  event = 'VeryLazy',

  config = function()
    require('mini.ai').setup {
      n_lines = 500,
      custom_textobjects = {
        o = require('mini.ai').gen_spec.treesitter {
          a = { '@block.outer', '@conditional.outer', '@loop.outer' },
          i = { '@block.inner', '@conditional.inner', '@loop.inner' },
        },
        f = require('mini.ai').gen_spec.treesitter {
          a = '@function.outer',
          i = '@function.inner',
        },
        t = {
          '<([%p%w]-)%f[^<%w][^<>]->.-</%1>',
          '^<.->().*()</[^/]->$',
        },
        d = { '%f[%d]%d+' },
        c = {
          { '%u[%l%d]+%f[^%l%d]', '%f[%S][%l%d]+%f[^%l%d]', '%f[%P][%l%d]+%f[^%l%d]', '^[%l%d]+%f[^%l%d]' },
          '^().*()$',
        },
      },
      mappings = { around_next = '', inside_next = '', around_last = '', inside_last = '', goto_left = '', goto_right = '', },
    }

    require('mini.cursorword').setup()
    require('mini.icons').setup()

    require('mini.indentscope').setup {
      draw = {
        animation = require('mini.indentscope').gen_animation.none(),
      },
    }

    require('mini.splitjoin').setup {
      mappings = { toggle = 'ss' },
    }

    local sl = require 'mini.statusline'
    local arrow = require 'arrow.statusline'
    sl.setup {
      content = {
        active = function()
          local mode, mode_hl = sl.section_mode { trunc_width = 120 }
          local filename = sl.section_filename { trunc_width = 140 }
          local arrow_status = arrow.text_for_statusline_with_icons()
          local location = '%2l:%-2v'

          return sl.combine_groups {
            { hl = mode_hl,      strings = { mode } },
            '%<',
            { hl = 'slFilename', strings = { filename } },
            '%=',
            { hl = 'slArrowStatus', strings = { arrow_status } },
            { hl = mode_hl,         strings = { location } },
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
      mappings = { find = '', find_left = '', highlight = '', update_n_lines = '', suffix_last = '', suffix_next = '' },
    }

    require('mini.visits').setup()
    vim.keymap.set('n', '<space>R', '<Cmd>lua require("util.visits").frecency_list(1)<CR>', { desc = 'Recent Files' })
    vim.keymap.set('n', '<space>r', '<Cmd>lua require("util.visits").frecency_list(0.5)<CR>', { desc = 'Frecent Files' }) end,
}
