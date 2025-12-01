return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,

  opts = {
    bigfile = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    quickfile = { enabled = true },

    picker = {
      hidden = true,
      sources = {
        scratch = { win = { input = { keys = {
          ['<c-n>'] = { 'list_down', mode = { 'n', 'i' } },
        } } } },
      },
      layout = {
        layout = {
          backdrop = false,
          min_width = 95,
          height = 0.9,
          width = 0.8,
          box = 'vertical',
          { win = 'preview', title = '{preview}', height = 0.7, border = 'single' },
          {
            box = 'vertical',
            border = 'single',
            title = '{title} {live} {flags}',
            { win = 'input', height = 1, border = 'bottom' },
            { win = 'list', border = 'none' },
          },
        },
      },
      win = {
        input = {
          keys = {
            ['<Esc>'] = { 'close', mode = { 'n', 'i' } },
            ['<c-d>'] = { 'preview_scroll_down', mode = { 'i', 'n' } },
            ['<c-u>'] = { 'preview_scroll_up', mode = { 'i', 'n' } },
            ['<c-h>'] = { 'toggle_help', mode = { 'i', 'n' } },
            ['<A-n>'] = { 'history_forward', mode = { 'i', 'n' } },
            ['<A-p>'] = { 'history_back', mode = { 'i', 'n' } },
          },
        },
      },
    },
  },

  keys = {
    {
      '<space>b',
      function()
        require('util.branch_files').snacks_branch_files()
      end,
      desc = 'Git Branch Files',
      mode = { 'n', 'x' },
    },
    { '<space>c', '<cmd>lua Snacks.picker.git_log_file()<cr>', desc = 'Git Commits File', mode = { 'n', 'x' } },
    {
      '<space>d',
      '<cmd>lua Snacks.picker.files({ cwd = vim.fn.expand("%:h") })<cr>',
      desc = 'Files in Dir',
      mode = { 'n', 'x' },
    },
    { '<space>f', '<cmd>lua Snacks.picker.grep_word()<cr>', desc = 'Grep Word', mode = { 'n', 'x' } },
    { '<space>g', '<cmd>lua Snacks.picker.git_status()<cr>', desc = 'Git Status', mode = { 'n', 'x' } },
    { '<space>h', '<cmd>lua Snacks.picker.help()<cr>', desc = 'Help', mode = { 'n', 'x' } },
    { '<space>j', '<cmd>lua Snacks.picker.grep()<cr>', desc = 'Live Grep', mode = { 'n', 'x' } },
    { '<space>n', '<cmd>lua Snacks.picker.notifications()<cr>', desc = 'Notifications', mode = { 'n', 'x' } },
    { '<space>r', '<cmd>lua Snacks.picker.recent()<cr>', desc = 'Recent Files', mode = { 'n', 'x' } },
    { '<space>t', '<cmd>lua Snacks.picker.smart()<cr>', desc = 'Smart Open Files', mode = { 'n', 'x' } },
    { '<space>u', '<cmd>lua Snacks.picker.resume()<cr>', desc = 'Resume Picker', mode = { 'n', 'x' } },
    { '<space>/', '<cmd>lua Snacks.picker.lines()<cr>', desc = 'Search Buffer', mode = { 'n', 'x' } },
    { ',u', '<cmd>lua Snacks.picker.undo()<cr>', desc = 'Undo List', mode = { 'n', 'x' } },
    { ',.', '<cmd>lua Snacks.scratch()<cr>', desc = 'Toggle Scratch Buffer', mode = { 'n', 'x' } },
    { ',>', '<cmd>lua Snacks.picker.scratch()<cr>', desc = 'Select Scratch Buffer', mode = { 'n', 'x' } },
    { 'sL', '<cmd>lua Snacks.gitbrowse()<cr>', desc = 'Git Browse (open)', mode = { 'n', 'x' } },
    {
      'sl',
      function()
        Snacks.gitbrowse {
          open = function(url)
            vim.fn.setreg('+', url)
          end,
          notify = false,
        }
      end,
      desc = 'Git Browse (copy)',
      mode = { 'n', 'x' },
    },
  },
}
