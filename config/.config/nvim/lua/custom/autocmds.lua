local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local auto_resize_group = augroup('AutoResize', { clear = true })
autocmd('VimResized', {
  group = auto_resize_group,
  pattern = '*',
  command = 'wincmd =',
})

local auto_save_and_read_group = augroup('AutoSaveAndRead', { clear = true })
autocmd({ 'InsertLeave', 'TextChanged' }, {
  group = auto_save_and_read_group,
  pattern = '*',
  callback = function()
    vim.cmd('silent! %s/\\s\\+$//e')
    vim.cmd('silent! wall')
  end,
})
autocmd('CursorHold', {
  group = auto_save_and_read_group,
  pattern = '*',
  command = 'silent! checktime',
})

local cursor_line_group = augroup('CursorLine', { clear = true })
autocmd({ 'WinEnter', 'InsertLeave' }, {
  group = cursor_line_group,
  pattern = '*',
  command = 'set cursorline',
})
autocmd({ 'WinLeave', 'InsertEnter' }, {
  group = cursor_line_group,
  pattern = '*',
  command = 'set nocursorline',
})

local ensure_directory_exists_group = augroup('EnsureDirectoryExists', { clear = true })
autocmd('BufNewFile', {
  group = ensure_directory_exists_group,
  pattern = '*',
  callback = function()
    require('util.ensure_directory_exists').ensure_directory_exists()
  end,
})

local fast_escape_group = augroup('FastEscape', { clear = true })
autocmd({ 'InsertEnter', 'CmdlineEnter' }, {
  group = fast_escape_group,
  pattern = '*',
  command = 'set timeoutlen=200',
})
autocmd({ 'InsertLeave', 'CmdlineLeave' }, {
  group = fast_escape_group,
  pattern = '*',
  command = 'set timeoutlen=1000',
})

local last_cursor_group = augroup('LastCursor', { clear = true })
autocmd('BufReadPost', {
  group = last_cursor_group,
  pattern = '*',
  callback = function()
    if vim.bo.filetype ~= 'gitcommit'
        and vim.fn.line("'\"") > 0
        and vim.fn.line("'\"") <= vim.fn.line('$') then
      vim.cmd('normal g`"')
    end
  end,
})

local last_file_on_startup_group = augroup('LastFileOnStartup', { clear = true })
autocmd('VimEnter', {
  group = last_file_on_startup_group,
  callback = function()
    vim.defer_fn(function()
      local api = vim.api
      local current_window = api.nvim_get_current_win()
      local main_window = api.nvim_list_wins()[1]

      if current_window ~= main_window then
        api.nvim_set_current_win(main_window)
      end

      require('util.last_file_cwd').last_buffer()

      if current_window ~= main_window then
        api.nvim_set_current_win(current_window)
      end
    end, 10)
  end,
})

local qf_group = augroup('QuickFix', { clear = true })
autocmd('QuickFixCmdPost', {
  group = qf_group,
  pattern = '*',
  callback = function()
    if #vim.fn.getqflist() > 0 then
      vim.cmd('Trouble quickfix')
    end
    if #vim.fn.getloclist(0) > 0 then
      vim.cmd('Trouble loclist')
    end
  end,
})

local function open_trouble_deferred()
  vim.defer_fn(function()
    vim.cmd('Trouble quickfix')
    vim.cmd('cclose')
  end, 10) -- Defer by 10 milliseconds
end

local trouble_quickfix_group = augroup('TroubleQuickFix', { clear = true })
autocmd('FileType', {
  group = trouble_quickfix_group,
  pattern = 'qf',
  callback = function()
    if vim.bo.filetype ~= 'Trouble' then
      open_trouble_deferred()
    end
  end,
})
