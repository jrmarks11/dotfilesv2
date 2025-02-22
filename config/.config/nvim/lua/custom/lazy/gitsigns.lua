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

        map('n', '[c', function()
          gs.prev_hunk()
          cmd 'normal! zz'
        end, { desc = 'Previous Git Change' })

        map('n', ']c', function()
          gs.next_hunk()
          cmd 'normal! zz'
        end, { desc = 'Next Git Change' })

        map('n', '<space>hb', function()
          gs.blame_line { full = true }
        end, { desc = 'Git Blame' })

        map('n', '<space>hB', function()
          gs.blame()
        end, { desc = 'Blame Buffer' })

        map('n', '<space>hs', gs.stage_hunk, { desc = 'Git Stage Hunk' })
        map('n', '<space>hv', gs.preview_hunk, { desc = 'Git Preview Hunk' })
        map('n', '<space>hu', gs.reset_hunk, { desc = 'Git Undo Hunk' })
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', 'GitSigns Select Hunk')
      end,
      max_file_length = 100000,
      sign_priority = 6,
    }
  end,

  cond = vim.fn.exists 'g:vscode' == 0,
}
