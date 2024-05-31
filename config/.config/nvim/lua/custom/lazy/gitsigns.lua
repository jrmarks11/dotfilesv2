return {
  'lewis6991/gitsigns.nvim',
  event = 'BufReadPre',
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
    local gitsigns = require 'gitsigns'
    gitsigns.setup {
      on_attach = function()
        local gs = package.loaded.gitsigns
        local map = vim.keymap.set
        local cmd = vim.cmd

        map('n', ']c', function()
          gs.next_hunk()
          cmd 'normal! zz'
        end, { desc = 'Next [C]hange' })

        map('n', '[c', function()
          gs.prev_hunk()
          cmd 'normal! zz'
        end, { desc = 'Previous [C]hange' })

        map('n', 'sb', function()
          gs.blame_line { full = true }
        end, { desc = 'Git [B]lame' })
        map('n', 'sg', gs.stage_hunk, { desc = '[G]it Stage Hunk' })
        map('n', 'sv', gs.preview_hunk, { desc = 'Pre[v]iew Hunk' })
        map('n', 'su', gs.reset_hunk, { desc = '[U]ndo Hunk' })
      end,
      max_file_length = 100000,
      sign_priority = 6,
    }
  end,

  cond = vim.fn.exists 'g:vscode' == 0,
}
