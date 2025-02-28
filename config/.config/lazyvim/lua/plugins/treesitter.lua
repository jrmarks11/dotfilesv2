return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    opts.textobjects = opts.textobjects or {}
    opts.textobjects.move = opts.textobjects.move or {}

    if opts.textobjects.move.goto_next_start then
      opts.textobjects.move.goto_next_start["]c"] = nil
    end
    if opts.textobjects.move.goto_next_end then
      opts.textobjects.move.goto_next_end["]C"] = nil
    end
    if opts.textobjects.move.goto_previous_start then
      opts.textobjects.move.goto_previous_start["[c"] = nil
    end
    if opts.textobjects.move.goto_previous_end then
      opts.textobjects.move.goto_previous_end["[C"] = nil
    end

    return opts
  end,
}
