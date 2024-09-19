return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "clangd",
        "clang-format",
        "pyright",
        "mypy",
        "black",
        "ruff-lsp",
      },
    },
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "lervag/vimtex",
    ft = {
      "tex",
      "bib",
    },
    init = function()
      require "configs.vimtex"
    end,
  },
  {
    "rhysd/vim-grammarous",
    lazy = false,
    init = function()
      require "configs.grammarous"
    end,
  },
  {
    "stevearc/vim-arduino",
    ft = {
      "arduino",
    },
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "configs.none-ls"
    end,
  },
}
