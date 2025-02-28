return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    opts.textobjects = opts.textobjects or {}
    opts.textobjects.move = opts.textobjects.move or {}

    if opts.textobjects.move.goto_next_start then
      opts.textobjects.move.goto_next_start["]c"] = nil
      opts.textobjects.move.goto_next_start["]a"] = nil
    end
    if opts.textobjects.move.goto_next_end then
      opts.textobjects.move.goto_next_end["]C"] = nil
      opts.textobjects.move.goto_next_end["]A"] = nil
    end
    if opts.textobjects.move.goto_previous_start then
      opts.textobjects.move.goto_previous_start["[c"] = nil
      opts.textobjects.move.goto_previous_start["[a"] = nil
    end
    if opts.textobjects.move.goto_previous_end then
      opts.textobjects.move.goto_previous_end["[C"] = nil
      opts.textobjects.move.goto_previous_end["[A"] = nil
    end

    opts.incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<cr>",
        node_decremental = "<bs>",
        node_incremental = "<cr>",
        scope_incremental = "<tab>",
      },
    }

    return opts
  end,
}
