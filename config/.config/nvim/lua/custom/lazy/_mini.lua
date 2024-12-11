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
      draw = { animation = require('mini.indentscope').gen_animation.none() },
    }

    require('mini.splitjoin').setup {
      mappings = { toggle = 'ss' },
    }

    require('mini.surround').setup {
      mappings = { find = '', find_left = '', highlight = '', update_n_lines = '', suffix_last = '', suffix_next = '' },
    }

    if not vim.g.vscode then
      require('mini.cursorword').setup()
      require('mini.icons').setup()

      local sl = require 'util.statusline'
      require('mini.statusline').setup {
        content = { active = sl.active, inactive = sl.inactive },
      }

      require('mini.visits').setup()
      vim.keymap.set(
        { 'n', 'x' },
        '<space>R',
        '<Cmd>lua require("util.visits").frecency_list(1)<CR>',
        { desc = 'Recent Files' }
      )
      vim.keymap.set(
        { 'n', 'x' },
        '<space>T',
        '<Cmd>lua require("util.visits").frecency_list(0.5)<CR>',
        { desc = 'Frecent Files' }
      )
    end
  end,
}
