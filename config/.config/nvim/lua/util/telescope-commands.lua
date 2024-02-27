local M = {}

function M.filter_git_files(oldfiles)
  local git_root = vim.fn.trim(vim.fn.system('git rev-parse --show-toplevel'))
  if vim.v.shell_error ~= 0 then
    print("Not in a git repository")
    return
  end

  local git_files_cmd = 'git -C "' .. git_root .. '" ls-files'
  local git_files_list = vim.fn.split(vim.fn.system(git_files_cmd), '\n')
  local filtered_files = {}

  for _, old_file in ipairs(oldfiles) do
    local relative_path = vim.fn.fnamemodify(old_file, ':.:' .. git_root)
    local git_relative_path = relative_path:gsub("^" .. git_root .. "/", "")
    if vim.tbl_contains(git_files_list, git_relative_path) then
      table.insert(filtered_files, old_file)
    end
  end

  return filtered_files
end

function M.git_recent_files()
  local oldfiles = vim.v.oldfiles
  local git_files = M.filter_git_files(oldfiles)

  require('telescope.pickers').new({}, {
      prompt_title = 'Recent Git Files',
      finder    = require('telescope.finders').new_table({
          results = git_files,
          entry_maker = function(entry)
            return {
              value = entry,
              display = vim.fn.fnamemodify(entry, ':~:.'),
              ordinal = entry,
            }
          end,
        }),
      sorter = require('telescope.config').values.generic_sorter({}),
      previewer = require('telescope.previewers').vim_buffer_cat.new({}),
      attach_mappings = function(prompt_bufnr, map)
        require('telescope.actions').select_default:replace(function()
          local selection = require('telescope.actions.state').get_selected_entry()
          require('telescope.actions').close(prompt_bufnr)
          vim.cmd('edit ' .. selection.value)
        end)
        return true
      end,
    }):find()
end

return M
