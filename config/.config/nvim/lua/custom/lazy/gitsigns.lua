return {
  'lewis6991/gitsigns.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    if vim.opt.diff:get() then
      return
    end

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
        end)

        map('n', '[c', function()
          gs.prev_hunk()
          cmd('normal! zz')
        end)

        map('n', 'sb', function() gs.blame_line({ full = true }) end)
        map('n', 'sg', gs.stage_hunk)
        map('n', 'sp', gs.preview_hunk)
        map('n', 'su', gs.reset_hunk)
      end,
      max_file_length = 100000,
      sign_priority = 6,
    })
  end,
  cond = vim.fn.exists('g:vscode') == 0
}
