return {
  'saghen/blink.cmp',
  event = 'InsertEnter',
  version = '*',

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
      ['<Tab>'] = {},
      ['<S-Tab>'] = {},
    },
    sources = {
      default = { 'lsp', 'path', 'buffer' },
      per_filetype = {
        sql = { 'dadbod', 'buffer' },
        lua = { 'lazydev', 'lsp', 'path', 'buffer' },
      },
      providers = {
        dadbod = { name = 'Dadbod', module = 'vim_dadbod_completion.blink' },
        lazydev = { name = 'LazyDev', module = 'lazydev.integrations.blink', score_offset = 100 },
      },
    },
  },

  cond = vim.fn.exists 'g:vscode' == 0,
}
