return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  event = { 'VeryLazy' },

  config = function()
    local harpoon = require('harpoon')
    harpoon:setup({ settings = { save_on_toggle = true, }, })

    local map = vim.keymap.set
    map('n', 'sn', function() harpoon:list():add() end, { desc = 'Add to harpoon' })
    map('n', 'sh', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'Toggle harpoon' })
    map('n', 'sj', function() harpoon:list():select(1) end, { desc = 'Select harpoon 1' })
    map('n', 'sk', function() harpoon:list():select(2) end, { desc = 'Select harpoon 2' })
    map('n', 'sl', function() harpoon:list():select(3) end, { desc = 'Select harpoon 3' })
    map('n', 's;', function() harpoon:list():select(4) end, { desc = 'Select harpoon 4' })
  end,

  cond = vim.fn.exists('g:vscode') == 0
}
