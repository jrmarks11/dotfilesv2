vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('jmarks-lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc)
      vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    map('gI', require('fzf-lua').lsp_implementations, '[G]oto [I]mplementation')
    map('gr', require('fzf-lua').lsp_references, '[G]oto [R]eferences')
    map(',c', vim.lsp.buf.code_action, '[C]ode Action')
    map('<space>s', require('fzf-lua').lsp_document_symbols, 'Document [S]ymbols')
    map('<space>D', require('fzf-lua').lsp_typedefs, 'Type [D]efinition')
    map('<space>S', require('fzf-lua').lsp_workspace_symbols, 'Workspace [S]ymbols')
    map(',R', vim.lsp.buf.rename, '[R]ename')
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
      end, 'Toggle Inlay [H]ints')
    end
  end,
})
