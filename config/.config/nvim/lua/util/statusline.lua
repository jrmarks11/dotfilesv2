local M = {}
local sl = require 'mini.statusline'

function M.active()
  local mode, mode_hl = sl.section_mode { trunc_width = 120 }
  local filename = sl.section_filename { trunc_width = 140 }
  local filetype = sl.section_fileinfo { trunc_width = 200 }
  local location = '%2l:%-2v'

  return sl.combine_groups {
    { hl = mode_hl, strings = { mode } },
    '%<',
    { hl = 'slFilename', strings = { filename } },
    '%=',
    { hl = 'slFiletype', strings = { filetype } },
    { hl = mode_hl, strings = { location } },
  }
end

function M.inactive()
  local filename = sl.section_filename { trunc_width = 140 }
  local location = '%2l:%-2v'

  return sl.combine_groups {
    '%<',
    { hl = 'slFilename', strings = { filename } },
    '%=',
    { hl = 'slInactive', strings = { location } },
  }
end

return M
