local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd('TextYankPost', {
  group = augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local auto_center_group = augroup('AutoCenter', { clear = true })
autocmd('CursorMoved', {
  group = auto_center_group,
  pattern = '*',
  callback = function()
    vim.cmd 'normal! zz'
  end,
})

local auto_resize_group = augroup('AutoResize', { clear = true })
autocmd('VimResized', {
  group = auto_resize_group,
  pattern = '*',
  command = 'wincmd =',
})

local auto_save_group = augroup('AutoSaveAndRead', { clear = true })
autocmd({ 'InsertLeave', 'TextChanged' }, {
  group = auto_save_group,
  pattern = '*',
  callback = function()
    vim.cmd 'silent! %s/\\s\\+$//e'
    vim.cmd 'silent! wall'
  end,
  nested = true,
})

local relative_number_group = augroup('RelativeNumber', { clear = true })
autocmd({ 'WinEnter', 'InsertLeave' }, {
  group = relative_number_group,
  pattern = '*',
  callback = function()
    vim.opt.relativenumber = true
  end,
})
autocmd({ 'WinLeave', 'InsertEnter' }, {
  group = relative_number_group,
  pattern = '*',
  callback = function()
    vim.opt.relativenumber = false
  end,
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
    if vim.bo.filetype ~= 'gitcommit' and vim.fn.line '\'"' > 0 and vim.fn.line '\'"' <= vim.fn.line '$' then
      vim.cmd 'normal g`"'
    end
  end,
})

local last_file_on_startup_group = augroup('LastFileOnStartup', { clear = true })
autocmd('VimEnter', {
  group = last_file_on_startup_group,
  callback = function()
    if #vim.fn.argv() == 0 and vim.bo.filetype ~= 'gitcommit' then
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
    end
  end,
})
