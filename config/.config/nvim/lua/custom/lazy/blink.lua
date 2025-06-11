return {
  'saghen/blink.cmp',
  version = '*',
  dependencies = { 'rafamadriz/friendly-snippets' },
  event = 'VeryLazy',

  opts = {
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
}
