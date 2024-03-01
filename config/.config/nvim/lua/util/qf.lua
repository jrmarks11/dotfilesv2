local M = {}

local function vim_cmd(command, backup_command)
  local cmd = vim.cmd
  local success, err = pcall(cmd, command)

  if not success and backup_command then
    local backup_success, backup_err = pcall(cmd, backup_command)
    if not backup_success then
      print(backup_err)
    end
  elseif not success then
    print(err)
  end
end

function M.safe_next(prefix)
  local next_cmd = prefix .. 'next'
  local first_cmd = prefix .. 'first'
  vim_cmd(next_cmd, first_cmd)
end

function M.safe_prev(prefix)
  local prev_cmd = prefix .. 'prev'
  local last_cmd = prefix .. 'last'
  vim_cmd(prev_cmd, last_cmd)
end

function M.toggle_list(list_type)
  local actions = {
    c = {
      check = function(win) return win.quickfix == 1 end,
      open = function() vim_cmd('copen') end,
      close = function() vim_cmd('cclose') end,
    },
    l = {
      check = function(win) return win.loclist == 1 end,
      open = function() vim_cmd('lopen') end,
      close = function() vim_cmd('lclose') end,
    }
  }

  local list_action = actions[list_type]
  local is_open = false

  for _, win in pairs(vim.fn.getwininfo()) do
    if list_action.check(win) then
      is_open = true
      break
    end
  end

  if is_open then
    list_action.close()
  else
    list_action.open()
  end
end

return M
