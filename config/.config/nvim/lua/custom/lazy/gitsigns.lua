return {
  'lewis6991/gitsigns.nvim',
  event = 'BufReadPre',
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
    local gitsigns = require('gitsigns')
    gitsigns.setup({
      signs = {
        add = { hl = 'GitSignsAdd', text = '┃' },
        change = { hl = 'GitSignsChange', text = '┃' },
        delete = { hl = 'GitSignsDelete', text = '▁' },
        topdelete = { hl = 'GitSignsDelete', text = '▔' },
        changedelete = { hl = 'GitSignsChangeDelete', text = '┃' },
        untracked = { hl = 'GitSignsUntracked', text = '┃' },
      },

      on_attach = function()
        local gs = package.loaded.gitsigns
        local map = vim.keymap.set
        local cmd = vim.cmd

        map('n', ']c', function()
          gs.next_hunk()
          cmd('normal! zz')
        end, { desc = 'Next hunk' })

        map('n', '[c', function()
          gs.prev_hunk()
          cmd('normal! zz')
        end, { desc = 'Previous hunk' })

        map('n', 'sb', function() gs.blame_line({ full = true }) end, { desc = 'Git Blame' })
        map('n', 'sg', gs.stage_hunk, { desc = 'Stage hunk' })
        map('n', 'sv', gs.preview_hunk, { desc = 'Preview hunk' })
        map('n', 'su', gs.reset_hunk, { desc = 'Undo hunk' })
      end,
      max_file_length = 100000,
      sign_priority = 6,
    })
  end,

  cond = vim.fn.exists('g:vscode') == 0
}
