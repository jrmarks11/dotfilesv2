local M = {}

function M.ensure_directory_exists()
  local required_dir = vim.fn.expand '%:h'

  print(vim.fn.isdirectory(required_dir))
  if vim.fn.isdirectory(required_dir) ~= 1 then
    local confirm_msg = string.format("'%s' doesn't exist. Create? (Y)es", required_dir)
    Snacks.input({ prompt = confirm_msg }, function(confirm)
      if confirm:lower() ~= 'yes' and confirm:lower() ~= 'y' then
        return
      end

      local success, err = pcall(vim.fn.mkdir, required_dir, 'p')

      if not success then
        vim.api.nvim_err_writeln(string.format("Can't create '%s': %s", required_dir, err))
      end
    end)
  end
end

return M
