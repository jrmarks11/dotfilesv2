return {
  'folke/trouble.nvim',
  event = { 'VeryLazy' },

  config = function()
    require('trouble').setup({
      icons = false,
    })

    vim.keymap.set('n', ',q', function()
      require('trouble').toggle()
    end)

    vim.keymap.set('n', ']q', function()
      require('trouble').next({ skip_groups = true, jump = true });
    end)

    vim.keymap.set('n', '[q', function()
      require('trouble').previous({ skip_groups = true, jump = true });
    end)
  end,

  cond = vim.fn.exists('g:vscode') == 0
}
