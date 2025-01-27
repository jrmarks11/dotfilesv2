return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    picker = {
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
    statuscolumn = { enabled = true },
  },
  keys = {
    { '<space>t', '<cmd>lua Snacks.picker.smart()<cr>', desc = 'Snacks Smart Open File' },
    { ',.', '<cmd>lua Snacks.scratch()<cr>', desc = 'Toggle Scratch Buffer' },
    { 'sH', '<cmd>lua Snacks.gitbrowse()<cr>', desc = 'Git Browse (open)', mode = { 'n', 'v' } },
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
      mode = { 'n', 'v' },
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
