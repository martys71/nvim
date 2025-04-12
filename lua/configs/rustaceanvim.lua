local map=vim.keymap.set

vim.g.rustaceanvim = {
  server = {
    on_attach = function(_, _)
      map("n", "<leader>k", ":RustLsp hover actions<CR>")
      map("n", "<leader>a", ":RustLsp codeAction<CR>")
    end,
  },
  tools = {
    float_win_config = {
      auto_focus = true,
    },
  },
}

