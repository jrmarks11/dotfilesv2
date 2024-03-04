return {
  'danymat/neogen',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'L3MON4D3/LuaSnip',
  },

  config = function()
    local neogen = require('neogen')

    neogen.setup({
      snippet_engine = 'luasnip'
    })

    local map = vim.keymap.set

    map('n', 'sf', function()
      neogen.generate({ type = 'func' })
    end)

    map('n', 'st', function()
      neogen.generate({ type = 'type' })
    end)
  end,
}
