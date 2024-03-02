return {
  'rhysd/clever-f.vim',
  {
    "github/copilot.vim",
    cond = vim.fn.exists('g:vscode') == 0
  },
  {
    'tpope/vim-commentary',
    cond = vim.fn.exists('g:vscode') == 0
  },
  {
    'romainl/vim-qf',
    cond = vim.fn.exists('g:vscode') == 0
  },
}
