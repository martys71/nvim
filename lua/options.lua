require "nvchad.options"

-- add yours here!
if vim.loop.os_uname().sysname == "Windows_NT" then
  vim.o.shell = "bash.exe"
  vim.o.shellcmdflag = "-c"
end

vim.filetype.add { extension = { wgsl = "wgsl" } }

vim.api.nvim_create_autocmd({"FileType"},
  {
    pattern = "wgsl",
    callback = function ()
      vim.opt.shiftwidth = 4
      vim.opt.tabstop = 4
      vim.opt.softtabstop = 4
    end
  })
-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
