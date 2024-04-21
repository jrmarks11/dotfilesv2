return {
  'folke/trouble.nvim',
  event = { 'VeryLazy' },

  config = function()
    require('trouble').setup({
      icons = false,
    })

    vim.keymap.set('n', ',q', function()
      require('trouble').toggle()
    end, { desc = 'Trouble' })

    vim.keymap.set('n', ']q', function()
      require('trouble').next({ skip_groups = true, jump = true });
    end, { desc = 'Next Trouble' })

    vim.keymap.set('n', '[q', function()
      require('trouble').previous({ skip_groups = true, jump = true });
    end, { desc = 'Previous Trouble' })
  end,

  cond = vim.fn.exists('g:vscode') == 0
}
