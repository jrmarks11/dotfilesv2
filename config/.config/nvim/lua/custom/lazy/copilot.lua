return {
  'zbirenbaum/copilot.lua',
  event = 'InsertEnter',

  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      panel = { enabled = false },

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
}
