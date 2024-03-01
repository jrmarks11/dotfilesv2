local M = {}

function M.safe_next(prefix)
  local next_cmd = prefix .. 'next'
  local first_cmd = prefix .. 'first'
  local success, _ = pcall(vim.cmd, next_cmd)
  if not success then
    vim.cmd(first_cmd)
  end
end

function M.safe_prev(prefix)
  local prev_cmd = prefix .. 'prev'
  local last_cmd = prefix .. 'last'
  local success, _ = pcall(vim.cmd, prev_cmd)
  if not success then
    vim.cmd(last_cmd)
  end
end

function M.toggle_list(list_type)
  local actions = {
    c = {
      check = function(win) return win.quickfix == 1 end,
      open = function() vim.cmd('copen') end,
      close = function() vim.cmd('cclose') end,
    },
    l = {
      check = function(win) return win.loclist == 1 end,
      open = function()
        local status, err = pcall(vim.cmd, 'lopen')
        if not status then
          print(err)
        end
      end,
      close = function() vim.cmd('lclose') end,
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
