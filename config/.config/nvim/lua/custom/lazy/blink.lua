return {
  'saghen/blink.cmp',
  event = 'InsertEnter',
  version = '*',
  dependencies = { 'rafamadriz/friendly-snippets' },

  init = function()
    vim.keymap.set('i', '<C-b>', "<cmd>lua require('blink.cmp').show()<CR>")
  end,

  opts = {
    completion = {
      menu = {
        auto_show = false,
      },
    },
    keymap = {
      ['<C-e>'] = {},
      ['<C-p>'] = { 'select_prev', 'fallback' },
      ['<C-n>'] = { 'select_next', 'fallback' },
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
      per_filetype = {
        sql = { 'dadbod', 'snippets', 'buffer' },
        lua = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
      },
      providers = {
        dadbod = { name = 'Dadbod', module = 'vim_dadbod_completion.blink' },
        lazydev = { name = 'LazyDev', module = 'lazydev.integrations.blink', score_offset = 100 },
      },
    },
  },

  cond = vim.fn.exists 'g:vscode' == 0,
}
