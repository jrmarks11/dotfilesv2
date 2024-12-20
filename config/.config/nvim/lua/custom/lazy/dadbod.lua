return {
  'kristijanhusak/vim-dadbod-ui',
  cmd = 'DBUIToggle',
  dependencies = {
    { 'tpope/vim-dadbod', lazy = true },
    {
      'kristijanhusak/vim-dadbod-completion',
      ft = { 'sql' },

      config = function()
        vim.api.nvim_exec([[ autocmd FileType sql setlocal omnifunc=vim_dadbod_completion#omni ]], false)
      end,
    },
  },

  init = function()
    vim.g.db_ui_execute_on_save = 0
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_save_location = os.getenv 'HOME' .. '/Projects/sql/'
    vim.keymap.set('n', 'sq', '<cmd>DBUIToggle<CR>', { desc = 'Toggle SQL DBUI' })
  end,

  cond = vim.fn.exists 'g:vscode' == 0,
}
