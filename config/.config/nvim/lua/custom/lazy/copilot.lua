return {
  'zbirenbaum/copilot.lua',
  event = 'InsertEnter',

  opts = {
    suggestion = {
      auto_trigger = true,

      keymap = {
        accept = '<tab>',
        accept_word = '<A-f>',
        accept_line = '<C-E>',
        next = '<M-]>',
        prev = '<M-[>',
        dismiss = '<C-]>',
      },
    },
  },

  cond = vim.fn.exists 'g:vscode' == 0,
}
