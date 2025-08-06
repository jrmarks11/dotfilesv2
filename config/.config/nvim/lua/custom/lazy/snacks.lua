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
      '<space>B',
      function()
        require('util.branch_files').snacks_branch_files()
      end,
      desc = 'Git Branch Files',
      mode = { 'n', 'x' },
    },
    { '<space>C', '<cmd>lua Snacks.picker.git_log_file()<cr>', desc = 'Git Commits File', mode = { 'n', 'x' } },
    {
      '<space>D',
      '<cmd>lua Snacks.picker.files({ cwd = vim.fn.expand("%:h") })<cr>',
      desc = 'Files in Dir',
      mode = { 'n', 'x' },
    },
    { '<space>F', '<cmd>lua Snacks.picker.grep_word()<cr>', desc = 'Grep Word', mode = { 'n', 'x' } },
    { '<space>G', '<cmd>lua Snacks.picker.git_status()<cr>', desc = 'Git Status', mode = { 'n', 'x' } },
    { '<space>H', '<cmd>lua Snacks.picker.help()<cr>', desc = 'Help', mode = { 'n', 'x' } },
    { '<space>I', '<cmd>lua Snacks.picker.lines()<cr>', desc = 'Grep Buffer', mode = { 'n', 'x' } },
    { '<space>J', '<cmd>lua Snacks.picker.grep()<cr>', desc = 'Live Grep', mode = { 'n', 'x' } },
    { '<space>N', '<cmd>lua Snacks.picker.notifications()<cr>', desc = 'Notifications', mode = { 'n', 'x' } },
    { '<space>P', '<cmd>lua Snacks.picker.lazy()<cr>', desc = 'Lazy Picker', mode = { 'n', 'x' } },
    { '<space>R', '<cmd>lua Snacks.picker.recent()<cr>', desc = 'Recent Files', mode = { 'n', 'x' } },
    { '<space>T', '<cmd>lua Snacks.picker.smart()<cr>', desc = 'Smart Open Files', mode = { 'n', 'x' } },
    { '<space>U', '<cmd>lua Snacks.picker.resume()<cr>', desc = 'Resume Picker', mode = { 'n', 'x' } },

    { ',u', '<cmd>lua Snacks.picker.undo()<cr>', desc = 'Undo List', mode = { 'n', 'x' } },
    { ',.', '<cmd>lua Snacks.scratch()<cr>', desc = 'Toggle Scratch Buffer', mode = { 'n', 'x' } },
    { ',>', '<cmd>lua Snacks.scratch.select()<cr>', desc = 'Select Scratch Buffer', mode = { 'n', 'x' } },

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

  init = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        _G.dbg = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dbg

        Snacks.toggle.option('spell', { name = 'Spelling' }):map ',p'
        Snacks.toggle.inlay_hints():map ',i'
      end,
    })
  end,
}
