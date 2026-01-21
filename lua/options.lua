require "nvchad.options"
require "configs.nushell"
require "configs.lsp"

vim.filetype.add { extension = { wgsl = "wgsl" } }
-- vim.filetype.add { extension = { pest = "pest" } }

vim.api.nvim_create_autocmd({ "filetype" }, {
  pattern = "wgsl",
  callback = function()
    vim.opt.shiftwidth = 4
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
  end,
})
-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = "*",
  callback = function()
    vim.lsp.buf.format()
  end,
})
