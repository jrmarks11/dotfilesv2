return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,

  opts = {
    bigfile = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    statuscolumn = { enabled = true },

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
      desc = 'Snacks Branch Files Picker',
      mode = { 'n', 'x' },
    },
    { '<space>f', '<cmd>lua Snacks.picker.grep_word()<cr>', desc = 'Snacks Grep Word Picker', mode = { 'n', 'x' } },
    { '<space>c', '<cmd>lua Snacks.picker.git_log_file()<cr>', desc = 'Snacks Grep Word Picker', mode = { 'n', 'x' } },
    {
      '<space>d',
      '<cmd>lua Snacks.picker.files({ cwd = vim.fn.expand("%:h") })<cr>',
      desc = 'Snacks File Dir Picker',
      mode = { 'n', 'x' },
    },
    { '<space>g', '<cmd>lua Snacks.picker.git_status()<cr>', desc = 'Snacks Git Status Picker', mode = { 'n', 'x' } },
    { '<space>i', '<cmd>lua Snacks.picker.lines()<cr>', desc = 'Snacks Lines Picker', mode = { 'n', 'x' } },
    { '<space>j', '<cmd>lua Snacks.picker.grep()<cr>', desc = 'Snacks Grep Picker', mode = { 'n', 'x' } },
    { '<space>n', '<cmd>lua Snacks.picker.notifications()<cr>', desc = 'Notifications Picker', mode = { 'n', 'x' } },
    { '<space>r', '<cmd>lua Snacks.picker.recent()<cr>', desc = 'Recent Files Picker', mode = { 'n', 'x' } },
    { '<space>t', '<cmd>lua Snacks.picker.smart()<cr>', desc = 'Snacks Smart Picker', mode = { 'n', 'x' } },
    { '<space>u', '<cmd>lua Snacks.picker.resume()<cr>', desc = 'Snacks Resume Picker', mode = { 'n', 'x' } },
    { ',u', '<cmd>lua Snacks.picker.undo()<cr>', desc = 'Snacks Smart Picker', mode = { 'n', 'x' } },
    { ',.', '<cmd>lua Snacks.scratch()<cr>', desc = 'Toggle Scratch Buffer', mode = { 'n', 'x' } },
    { 'sH', '<cmd>lua Snacks.gitbrowse()<cr>', desc = 'Git Browse (open)', mode = { 'n', 'x' } },
    {
      'sh',
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
