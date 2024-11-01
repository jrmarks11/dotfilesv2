return {
  'AndrewRadev/switch.vim',
  event = 'VeryLazy',

  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "elixir",
      callback = function()
        local elixir_module_with_function = [[\%([A-Z]\+[a-z\dA-Z]\+\.\)*\k\+]]
        local elixir_values = [[\%([:@]\{0,1}\k\+\)\|\%\(fn.\+end\)\|\%(&(.\+)\)]]

        vim.b.switch_definitions = {
          vim.g.switch_builtins.ruby_hash_style,
          vim.g.switch_builtins.elixir_list_shorthand,
          { 'assert',          'refute' },
          { 'assert_enqueued', 'refute_enqueued' },
          {
            ['"\\(\\k\\+\\%([?!]\\)\\=\\)"'] = ':\\1',
            [':\\(\\k\\+\\%([?!]\\)\\=\\)'] = '"\\1"'
          },
          {
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
}
