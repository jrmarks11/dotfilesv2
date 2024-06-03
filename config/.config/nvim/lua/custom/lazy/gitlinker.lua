return {
  'ruifm/gitlinker.nvim',
  event = { 'VeryLazy' },
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
    require('gitlinker').setup {
      mappings = nil,
    }

    vim.keymap.set('n', 'sh', function()
      require('gitlinker').get_buf_range_url 'n'
    end, { desc = 'Git[H]ub link for current buffer' })

    vim.keymap.set('v', 'sh', function()
      require('gitlinker').get_buf_range_url 'v'
    end, { desc = 'Git[H]ub link for current buffer' })
  end,

  cond = vim.fn.exists 'g:vscode' == 0,
}
