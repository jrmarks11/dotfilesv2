print("branch_files.lua loaded")

local M = {}

local telescope = require('telescope')
local finders = require('telescope.finders')
local pickers = require "telescope.pickers"
local previewers = require('telescope.previewers')
local conf = require('telescope.config').values

local function system_branch_files()
  local base_dir = vim.fn.getcwd()
  print("Base directory: " .. base_dir)
  local result = vim.fn.system('branch_files')
  local files = {}
  for s in result:gmatch("[^\r\n]+") do
    local full_path = vim.fn.expand(s)
    print("Found file: " .. full_path)
    if full_path:sub(1, #base_dir) == base_dir then
      print("Adding file: " .. full_path)
      table.insert(files, s)
    end
  end
  return files
end

function M.branch_files()
  print("telsecope extensiont")
  telescope.extensions.branch_files = function(opts)
    print("branch_files")
    opts = opts or {}
    opts.entry_maker = opts.entry_maker or function(entry)
      return {
        value = entry,
        display = entry,
        ordinal = entry,
      }
    end
    print("Launching Telescope picker...")

    pickers.new(opts, {
      prompt_title = "Branch Files",
      finder = finders.new_table({
        results = system_branch_files(),
        entry_maker = opts.entry_maker,
      }),
      previewer = previewers.git_file_diff.new(opts),
      sorter = conf.generic_sorter(opts),
    }):find()
  end

  telescope.extensions.branch_files()
end

return M
