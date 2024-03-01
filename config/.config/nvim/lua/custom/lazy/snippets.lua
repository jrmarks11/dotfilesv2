return {
  {
    'L3MON4D3/LuaSnip',
    version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)

    dependencies = { 'rafamadriz/friendly-snippets' },

    config = function()
      local ls = require('luasnip')
      local map = vim.keymap.set

      map({ 'i' }, 'se', function() ls.expand() end, { silent = true })
      map({ 'i', 's' }, 's;', function() ls.jump(1) end, { silent = true })
      map({ 'i', 's' }, 's,', function() ls.jump(-1) end, { silent = true })
      map({ 'i', 's' }, 'sE', function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, { silent = true })
    end,
  }
}
