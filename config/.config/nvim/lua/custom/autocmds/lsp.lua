vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('jmarks-lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc)
      vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    map('gd', vim.lsp.buf.definition, 'Goto Definition')
    map('gr', require('fzf-lua').lsp_references, 'Goto References')
    map(',c', vim.lsp.buf.code_action, 'Code Action')
    map(',r', vim.lsp.buf.rename, 'Rename')
    map('<C-k>', vim.lsp.buf.hover, 'Hover Documentation')
  end,
})
