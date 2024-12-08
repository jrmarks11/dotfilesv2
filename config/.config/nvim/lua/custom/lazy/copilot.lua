return {
  'github/copilot.vim',
  event = "InsertEnter",

  cond = vim.fn.exists 'g:vscode' == 0,
}
