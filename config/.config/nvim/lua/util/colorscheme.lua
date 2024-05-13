local M = {}

function M.picker()
  local function MyColorSchemes()
    local colorschemes = {
      'catppuccin',
      'tokyonight',
      'solarized',
      'gruvbox',
    }

    return colorschemes
  end

  local function load_colorschemes()
    local colorschemes = MyColorSchemes()

    for _, scheme in ipairs(colorschemes) do
      if not pcall(require, scheme) then
        vim.cmd('packadd ' .. scheme)
      end
    end
  end

  load_colorschemes()
  local colorschemes = MyColorSchemes()

  require('fzf-lua').colorschemes({ colors = colorschemes, })
end

return M
