-- local cmp = require "cmp"

return {
  {
    import = "nvchad.blink.lazyspec",

  },
  -- {
  --   "neovim/nvim-lspconfig",
  --   config = function()
  --     require "configs.lspconfig"
  --   end,
  -- },
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
    init = function()
      require("render-markdown").enable()
    end,
  },
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "codelldb",
        "pest-language-server",
        "pyright",
        "rust-analyzer",
        "wgsl-analyzer",
        -- "sqlls",
      },
      automatic_installation = true,
    },
    config = function()
      require("mason").setup {}
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "rust",
        "wgsl",
        "markdown",
        "markdown_inline",
      },
      highlight = { enable = true },
    },
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = false,
    config = function()
      require "configs.rustaceanvim"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    init = function()
      require "configs.nvim-dap"
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "nvim-neotest/nvim-nio",
  },
  -- {
  --   "saecki/crates.nvim",
  --   ft = { "toml" },
  --   config = function(_, opts)
  --     local crates = require "crates"
  --     crates.setup(opts)
  --     require "configs.crates-mappings"
  --     require("cmp").setup.buffer {
  --       sources = { { name = "crates" } },
  --     }
  --     crates.show()
  --   end,
  -- },
  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = false,
    config = function(_, _)
      require("nvim-dap-virtual-text").setup()
    end,
  },
  {
    "pest-parser/pest.vim",
    ft = "pest",
    config = function()
      require("pest-vim").setup {}
    end,
  },
  {
    "nvim-neorg/neorg",
    lazy = false,  -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
        },
      }
    end,
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod",                     lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
  {
    'saghen/blink.cmp',
    opts = function()
      require "configs.blink"
    end
  },
  {
    'cordx56/rustowl',
    version = '*',
    build = 'cargo binstall rustowl',
    lazy = false,
    opts = {
      client = {
        on_attach = function(_, buffer)
          vim.keymap.set('n', '<leader>o', function()
            require('rustowl').toggle(buffer)
          end, { buffer = buffer, desc = 'Toggle RustOwl' })
        end
      },
    },
  }
}
