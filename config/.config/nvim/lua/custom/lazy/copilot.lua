return {
  'github/copilot.vim',
  event = 'VeryLazy',

  cond = vim.fn.exists 'g:vscode' == 0,
}
