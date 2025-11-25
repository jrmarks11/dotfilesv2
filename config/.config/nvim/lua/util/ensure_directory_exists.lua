local M = {}

function M.ensure_directory_exists()
  local required_dir = vim.fn.expand '%:h'

  if vim.fn.isdirectory(required_dir) ~= 1 then
    local max_length = 25
    local display_dir = required_dir

    if #required_dir > max_length then
      display_dir = '...' .. required_dir:sub(-max_length)
    end

    local confirm_msg = string.format("'%s' doesn't exist. Create? (Y)es", display_dir)

    Snacks.input({ prompt = confirm_msg }, function(confirm)
      if confirm:lower() ~= 'yes' and confirm:lower() ~= 'y' then
        return
      end

      local success, err = pcall(vim.fn.mkdir, required_dir, 'p')

      if not success then
        vim.notify(string.format("Can't create '%s': %s", required_dir, err), vim.log.levels.ERROR)
      end
    end)
  end
end

return M
