return {
  "lewis6991/gitsigns.nvim",
  opts = function(_, opts)
    local old_on_attach = opts.on_attach

    opts.on_attach = function(bufnr)
      if old_on_attach then old_on_attach(bufnr) end

      vim.keymap.set("n", "<Leader>gd", "<Cmd>CodeDiff<CR>", {
        buffer = bufnr,
        desc = "Open CodeDiff",
      })
    end
  end,
}
