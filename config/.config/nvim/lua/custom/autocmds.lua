local auto_resize_group = vim.api.nvim_create_augroup('AutoResize', { clear = true })
vim.api.nvim_create_autocmd('VimResized', {
    group = auto_resize_group,
    pattern = '*',
    command = 'wincmd =',
  })

local auto_save_and_read_group = vim.api.nvim_create_augroup('AutoSaveAndRead', { clear = true })
vim.api.nvim_create_autocmd({ 'InsertLeave', 'TextChanged' }, {
    group = auto_save_and_read_group,
    pattern = '*',
    callback = function()
      vim.cmd('silent! %s/\\s\\+$//e')
      vim.cmd('silent! wall')
    end,
  })
vim.api.nvim_create_autocmd('CursorHold', {
    group = auto_save_and_read_group,
    pattern = '*',
    command = 'silent! checktime',
  })

local cursor_line_group = vim.api.nvim_create_augroup('CursorLine', { clear = true })
vim.api.nvim_create_autocmd({ 'WinEnter', 'InsertLeave' }, {
    group = cursor_line_group,
    pattern = '*',
    command = 'set cursorline',
  })
vim.api.nvim_create_autocmd({ 'WinLeave', 'InsertEnter' }, {
    group = cursor_line_group,
    pattern = '*',
    command = 'set nocursorline',
  })

local fast_escape_group = vim.api.nvim_create_augroup('FastEscape', { clear = true })
vim.api.nvim_create_autocmd({ 'InsertEnter', 'CmdlineEnter' }, {
    group = fast_escape_group,
    pattern = '*',
    command = 'set timeoutlen=200',
  })
vim.api.nvim_create_autocmd({ 'InsertLeave', 'CmdlineLeave' }, {
    group = fast_escape_group,
    pattern = '*',
    command = 'set timeoutlen=1000',
  })
