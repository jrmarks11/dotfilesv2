return {
  'saghen/blink.cmp',
  ft = { 'sql' },

  opts = {
    keymap = {
      ['<C-e>'] = {},
      ['<Tab>'] = {},
      ['<S-Tab>'] = {},
    },
    sources = {
      default = { 'lsp', 'path', 'buffer' },
      per_filetype = {
        sql = { 'dadbod', 'buffer' },
      },
      providers = {
        dadbod = { name = 'Dadbod', module = 'vim_dadbod_completion.blink' },
      },
    },
  },

  cond = vim.fn.exists 'g:vscode' == 0,
}
