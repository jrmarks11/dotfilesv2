return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  dependencies = { 'williamboman/mason.nvim' },
  event = { 'VeryLazy' },

  config = function()
    local ensure_installed = {
      'beautysh',
      'efm',
      'elixirls',
      'emmet_language_server',
      'lua_ls',
      'stylua',
      'tsserver',
    }

    require('mason-tool-installer').setup {
      ensure_installed = ensure_installed,
      auto_update = true,
      run_on_start = true,
      start_delay = 3000,
      debug = true,
    }
  end,
}
