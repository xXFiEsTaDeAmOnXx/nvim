local plugins = {
  {
      "neovim/nvim-lspconfig",
      config = function ()
        require "plugins.configs.lspconfig"
        require  "custom.configs.lspconfig"
      end
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
        "ruff-lsp"
      },
    }
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
  "lervag/vimtex",
  ft = {
      "tex",
      "bib",
    },
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    require "custom.configs.vimtex"
  end
 },
  {
    "rhysd/vim-grammarous",
    lazy = false,
    init = function ()
      require "custom.configs.grammarous"
    end
  },
  {
    "stevearc/vim-arduino",
    ft = {
      "arduino",
    }
  },{
   "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function ()
      return require "custom.configs.none-ls"
    end
 }
}
return plugins
