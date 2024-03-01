return {
  'L3MON4D3/LuaSnip',
  version = 'v2.*',

  dependencies = { 'rafamadriz/friendly-snippets' },

  config = function()
    local ls = require('luasnip')
    local map = vim.keymap.set

    map({ 'i' }, '<C-s>C-i>', function() ls.expand() end, { silent = true })
    map({ 'i', 's' }, '<C-s><C-j>', function() ls.jump(1) end, { silent = true })
    map({ 'i', 's' }, '<C-s><C-k>', function() ls.jump(-1) end, { silent = true })
    map({ 'i', 's' }, '<C-s><C-c>', function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, { silent = true })
  end,
  cond = vim.fn.exists('g:vscode') == 0
}
