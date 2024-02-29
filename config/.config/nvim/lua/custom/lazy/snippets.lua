return {
  {
    'L3MON4D3/LuaSnip',
    version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)

    dependencies = { 'rafamadriz/friendly-snippets' },

    config = function()
      local ls = require('luasnip')

      vim.keymap.set({ 'i' }, 'se', function() ls.expand() end, { silent = true })

      vim.keymap.set({ 'i', 's' }, 's;', function() ls.jump(1) end, { silent = true })
      vim.keymap.set({ 'i', 's' }, 's,', function() ls.jump(-1) end, { silent = true })

      vim.keymap.set({ 'i', 's' }, 'sE', function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, { silent = true })
    end,
  }
}
