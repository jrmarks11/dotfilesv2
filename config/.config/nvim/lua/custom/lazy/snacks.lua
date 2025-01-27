return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,

  opts = {
    bigfile = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    statuscolumn = { enabled = true },
  },

  keys = {
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
