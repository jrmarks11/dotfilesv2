return {
  'github/copilot.vim',
  cond = vim.fn.exists('g:vscode') == 0
}
