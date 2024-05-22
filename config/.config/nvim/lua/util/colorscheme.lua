local M = {}

local function detect_system_theme()
  local handle = io.popen 'defaults read -g AppleInterfaceStyle 2>/dev/null'
  if not handle then
    return 'light'
  end

  local result = handle:read '*a'
  handle:close()

  if not result then
    return 'light'
  end

  if result:match 'Dark' then
    return 'dark'
  end

  return 'light'
end

function M.set_based_on_system_theme()
  local theme = detect_system_theme()
  if theme == 'dark' then
    vim.o.background = 'dark'
    vim.cmd.colorscheme 'tokyonight'
  else
    vim.o.background = 'light'
    vim.cmd.colorscheme 'catppuccin'
  end
end

function M.picker()
  local function MyColorSchemes()
    local colorschemes = {
      'catppuccin',
      'tokyonight',
    }

    return colorschemes
  end

  local colorschemes = MyColorSchemes()
  require('fzf-lua').colorschemes { colors = colorschemes }
end

return M
