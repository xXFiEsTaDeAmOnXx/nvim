return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        signature = {
          enabled = false, -- Disable Noice signature handling
        },
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup {
        background_colour = "#1a1b26",
      }
    end,
  },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {
      select = {
        backend = { "nui", "telescope", "fzf_lua", "fzf", "builtin" },
      },
    },
  },
  {
    "folke/snacks.nvim", -- plugin to visulize iamges
    event = "VeryLazy",
    opts = {
      image = {},
    },
  },
  {
    "mfussenegger/nvim-lint",
    ft = { "tex" },
    config = function()
      require "configs.linter"
    end,
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = require "configs.trouble",
  },
  {
    "NeogitOrg/neogit",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require "configs.neogit"
    end,
  },

  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    lazy = false,
    config = function()
      require("tiny-inline-diagnostic").setup {
        options = {
          multilines = { enabled = true },
          show_source = { enabled = true },
        },
      }
      -- Disable global virtual text and virtual lines
      local disable_virtual = function()
        vim.diagnostic.config { virtual_text = false, virtual_lines = false }
        for _, ns in pairs(vim.diagnostic.get_namespaces()) do
          vim.diagnostic.config({ virtual_text = false, virtual_lines = false }, ns)
        end
      end

      -- Run immediately for existing namespaces
      disable_virtual()

      -- Ensure any new LSP client also respects this
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          vim.diagnostic.config { virtual_text = false }
        end,
      })
    end,
  },
}
