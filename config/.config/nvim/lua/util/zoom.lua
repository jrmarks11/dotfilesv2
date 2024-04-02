local M = {}

function M.zoom_util()
  local win_list = vim.api.nvim_tabpage_list_wins(0)
  if #win_list > 1 then
    vim.cmd('tab split')
  else
    local current_buf = vim.api.nvim_get_current_buf()
    local tabpages = vim.api.nvim_list_tabpages()
    local buf_in_multiple_tabs = false

    for _, tabpage in ipairs(tabpages) do
      local wins = vim.api.nvim_tabpage_list_wins(tabpage)
      for _, win in ipairs(wins) do
        if vim.api.nvim_win_get_buf(win) == current_buf then
          if buf_in_multiple_tabs then
            vim.cmd('tabclose')
            return
          else
            buf_in_multiple_tabs = true
          end
        end
      end
    end
  end
end

return M
