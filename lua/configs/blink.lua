local opts = require "nvchad.blink.config"

-- print(vim.inspect(opts))

opts.fuzzy = {
  implementation = "lua",
}

opts.sources.per_filetype = {
  sql = { "lsp", "dadbod" },
}

opts.sources.providers = {
  dadbod = {
    name = "Dadbod",
    module = "vim_dadbod_completion.blink",
    enabled = true,
  },
}

opts.completion.list = { selection = { preselect = false, auto_insert = false } }
-- opts.keymap = {
-- preset = 'default',
-- ['<ESC>'] = { 'hide', 'fallback' },
-- ['jk'] = { 'hide', 'fallback' },
-- }
return opts
