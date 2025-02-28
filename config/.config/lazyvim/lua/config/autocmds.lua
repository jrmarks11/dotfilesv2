local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local auto_resize_group = augroup("AutoResize", { clear = true })
autocmd("VimResized", {
  group = auto_resize_group,
  pattern = "*",
  command = "wincmd =",
})

local auto_save_group = augroup("AutoSaveAndRead", { clear = true })
autocmd({ "InsertLeave", "TextChanged" }, {
  group = auto_save_group,
  pattern = "*",
  callback = function()
    vim.cmd("silent! %s/\\s\\+$//e")
    vim.cmd("silent! wall")
  end,
  nested = true,
})

local ensure_directory_exists_group = augroup("EnsureDirectoryExists", { clear = true })
autocmd("BufNewFile", {
  group = ensure_directory_exists_group,
  pattern = "*",
  callback = function()
    require("util.ensure_directory_exists").ensure_directory_exists()
  end,
})

local fast_escape_group = augroup("FastEscape", { clear = true })
autocmd({ "InsertEnter", "CmdlineEnter" }, {
  group = fast_escape_group,
  pattern = "*",
  command = "set timeoutlen=200",
})
autocmd({ "InsertLeave", "CmdlineLeave" }, {
  group = fast_escape_group,
  pattern = "*",
  command = "set timeoutlen=1000",
})

local last_cursor_group = augroup("LastCursor", { clear = true })
autocmd("BufReadPost", {
  group = last_cursor_group,
  pattern = "*",
  callback = function()
    if vim.bo.filetype ~= "gitcommit" and vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.cmd('normal g`"')
    end
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
