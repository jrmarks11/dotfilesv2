return {
  'folke/lazydev.nvim',
  ft = 'lua',

  opts = {
    library = {
      { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
    },
  },

  cond = vim.fn.exists 'g:vscode' == 0,
}
