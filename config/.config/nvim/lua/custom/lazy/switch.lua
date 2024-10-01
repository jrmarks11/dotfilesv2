return {
  {
    'AndrewRadev/switch.vim',
    event = 'VeryLazy',

    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "elixir",
        callback = function()
          local elixir_module_with_function = [[\%([A-Z]\+[a-z\dA-Z]\+\.\)*\k\+]]
          local elixir_variable = [[\k\+]]
          local elixir_values = [[\%([:@]\{0,1}\k\+\)\|\%\(fn.\+end\)\|\%(&(.\+)\)]]

          vim.b.switch_definitions = {
            vim.g.switch_builtins.ruby_hash_style,
            vim.g.switch_builtins.elixir_list_shorthand,
            { 'assert', 'refute' },
            {
              ['"\\(\\k\\+\\%([?!]\\)\\=\\)"'] = ':\\1',
              [':\\(\\k\\+\\%([?!]\\)\\=\\)'] = '"\\1"'
            },
            {
              ['&\\(' .. elixir_module_with_function .. '\\)/1'] = 'fn arg -> \\1(arg) end',
              ['&\\(' .. elixir_module_with_function .. '\\)/2'] = 'fn arg1, arg2 -> \\1(arg1, arg2) end',
              ['&\\(' .. elixir_module_with_function .. '\\)/3'] = 'fn arg1, arg2, arg3 -> \\1(arg1, arg2, arg3) end',
              ['fn \\(' .. elixir_variable .. '\\) -> \\(' .. elixir_module_with_function .. '\\)(\\1) end'] = '&\\2/1',
              ['fn \\(' .. elixir_variable .. '\\), \\(' .. elixir_variable .. '\\) -> \\(' .. elixir_module_with_function .. '\\)(\\1, \\2) end'] =
              '&\\3/2',
              ['\\(' .. elixir_module_with_function .. '\\)(\\(' .. elixir_values .. '\\),\\s*'] = '\\2 |> \\1(',
              ['\\(' .. elixir_module_with_function .. '\\)(\\(' .. elixir_values .. '\\))'] = '\\2 |> \\1()',
              ['\\(' .. elixir_values .. '\\)\\s*|>\\s*\\(' .. elixir_module_with_function .. '\\)()'] = '\\2(\\1)',
              ['\\(' .. elixir_values .. '\\)\\s*|>\\s*\\(' .. elixir_module_with_function .. '\\)(\\(' .. elixir_values .. '\\))'] =
              '\\2(\\1, \\3)',
              ['\\(' .. elixir_values .. '\\)\\s*|>\\s*\\(' .. elixir_module_with_function .. '\\)(\\(' .. elixir_values .. '\\),\\s*'] =
              '\\2(\\1, \\3, '
            },
          }
        end,
      })
    end,
  },
}
