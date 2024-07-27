vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('jmarks-lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc)
      vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    map('gd', vim.lsp.buf.definition, 'Goto Definition')
    map('gD', vim.lsp.buf.declaration, 'Goto Declaration')
    map('gI', require('fzf-lua').lsp_implementations, 'Goto Implementation')
    map('gr', require('fzf-lua').lsp_references, 'Goto References')
    map(',c', vim.lsp.buf.code_action, 'Code Action')
    map('<space>s', require('fzf-lua').lsp_document_symbols, 'Document Symbols')
    map('<space>D', require('fzf-lua').lsp_typedefs, 'Type Definition')
    map('<space>S', require('fzf-lua').lsp_workspace_symbols, 'Workspace Symbols')
    map(',r', vim.lsp.buf.rename, 'Rename')
    map('<C-k>', vim.lsp.buf.hover, 'Hover Documentation')

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.server_capabilities.documentHighlightProvider then
      local highlight_augroup = vim.api.nvim_create_augroup('jmarks-lsp-highlight', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('jmarks-lsp-detach', { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds { group = 'jmarks-lsp-highlight', buffer = event2.buf }
        end,
      })
    end

    if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
      map(',h', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end, 'Toggle Inlay Hints')
    end
  end,
})
