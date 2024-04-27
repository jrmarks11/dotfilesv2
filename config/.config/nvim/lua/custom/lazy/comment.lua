return {
  'numToStr/Comment.nvim',
  event = 'VeryLazy',

  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
    'nvim-treesitter/nvim-treesitter',
  },

  config = function()
    require('ts_context_commentstring').setup {
      enable_autocmd = false,
    }

    local prehook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
    require('Comment').setup {
      ignore = '^$',
      pre_hook = prehook
    }
  end,

  cond = vim.fn.exists('g:vscode') == 0
}
