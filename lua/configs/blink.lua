local opts = require "nvchad.blink.config"

-- print(vim.inspect(opts))

opts.fuzzy = {
  implementation = "prefer_rust_with_warning",
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

return opts
