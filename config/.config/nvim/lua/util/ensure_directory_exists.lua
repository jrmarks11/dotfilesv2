local M = {}

function M.ensure_directory_exists()
  local required_dir = vim.fn.expand '%:h'

  print(vim.fn.isdirectory(required_dir))
  if vim.fn.isdirectory(required_dir) ~= 1 then
    local confirm_msg = string.format("Directory '%s' doesn't exist. Create it?", required_dir)
    local confirm = vim.fn.confirm(confirm_msg, '&Yes\n&No', 1)

    print(confirm)

    if confirm ~= 1 then
      return
    end

    local success, err = pcall(vim.fn.mkdir, required_dir, 'p')

    if not success then
      vim.api.nvim_err_writeln(string.format("Can't create '%s': %s", required_dir, err))
    end
  end
end

return M
