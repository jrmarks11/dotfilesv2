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
          row = 1,
          width = 0.4,
          min_width = 95,
          height = 0.9,
          border = 'none',
          box = 'vertical',
          { win = 'preview', title = '{preview}', height = 0.7, border = 'single' },
          {
            box = 'vertical',
            border = 'single',
            title = '{title} {live} {flags}',
            title_pos = 'center',
            { win = 'input', height = 1, border = 'bottom' },
            { win = 'list', border = 'none' },
          },
        },
      },
      win = {
        input = {
          keys = {
            ['<Esc>'] = { 'close', mode = { 'n', 'i' } },
          },
        },
      },
    },
    statuscolumn = { enabled = true },
  },
  keys = {
    {
      ',.',
      function()
        Snacks.scratch()
      end,
      desc = 'Toggle Scratch Buffer',
    },
    {
      'sH',
      function()
        Snacks.gitbrowse()
      end,
      desc = 'Git Browse (open)',
      mode = { 'n', 'v' },
    },
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
    {
      '<space>t',
      function()
        Snacks.picker.smart()
      end,
      'Snacks Smart Open File',
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
