return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },
  {
    "folke/neoconf.nvim",
    lazy = false,
    config = function()
      require("neoconf").setup {}
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "c",
        "cpp",
        "markdown",
        "markdown_inline",
        "toml",
        "meson",
        "make",
        "hyprlang",
        "gitignore",
        "fish",
        "dockerfile",
        "python",
        "rust",
        "latex",
      },
    },
    config = function(_, opts)
      local mason_bin_path = vim.fn.stdpath "data" .. "/mason/bin"
      if vim.loop.os_uname().sysname == "Windows_NT" then
        vim.env.PATH = mason_bin_path .. ";" .. vim.env.PATH
      else
        vim.env.PATH = mason_bin_path .. ":" .. vim.env.PATH
      end
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    ft = {
      "tex",
      "bib",
    },
    init = function()
      require "configs.vimtex"
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = {
      sources = {
        { name = "nvim_lsp" },
        { name = "vimtex" },
        { name = "path" },
        { name = "buffer" },
      },
    },
    experimental = {
      ghost_text = true, --enable ghost_text
    },
    dependencies = {
      "hrsh7th/cmp-buffer", -- source for text in buffer
      "hrsh7th/cmp-path", -- source for file system path
      "hrsh7th/cmp-nvim-lsp", -- using LSP for source
      "L3MON4D3/LuaSnip", -- snippet engine
      "saadparwaiz1/cmp_luasnip", -- using LuaSnip for source
      "micangl/cmp-vimtex", -- source of vimtex for latex
    },
  },
  {
    "stevearc/vim-arduino",
    ft = {
      "arduino",
    },
  },
  {
    "towolf/vim-helm",
    ft = { "helm" },
  },

  {
    "barreiroleo/ltex_extra.nvim",
    ft = { "markdown", "tex" },
    dependencies = { "neovim/nvim-lspconfig" },
  },
  {
    "EthanJWright/vs-tasks.nvim",
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("configs.vstask").setup()
    end,
  },
}
