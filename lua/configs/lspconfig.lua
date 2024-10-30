-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = { "clangd" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server
lspconfig.rust_analyzer.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = { "rust" },
  root_dir = lspconfig.util.root_pattern "Cargo.toml",
  settings = {
    ["rust_analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
}

lspconfig.clangd.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
}

lspconfig.pyright.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = { "python" },
}

lspconfig.ruff_lsp.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = { "python" },
}

lspconfig.ltex.setup {
  settings = {
    ltex = {
      language = "en-US",
    },
  },
  on_attach = function(client, bufnr)
    -- Mappings
    local ltex_mappings = {
      n = {
        -- LSP Diagnostics
        ["<leader>ll"] = {
          "<cmd> VimtexCompile <CR>",
          { desc = "Start LaTeX Compiler" },
        },
        ["<leader>lo"] = {
          "<cmd> VimtexCompileOutput <CR>",
          { desc = "Show Compiler Output" },
        },
        ["<leader>le"] = {
          "<cmd> VimtexErrors <CR>",
          { desc = "Start LaTeX Compiler" },
        },
        ["<leader>lv"] = {
          "<cmd> VimtexView <CR>",
          { desc = "Start LaTeX Compiler" },
        },
      },
    }
    local opts = { buffer = bufnr, silent = true }
    for mode, maps in pairs(ltex_mappings) do
      for key, val in pairs(maps) do
        -- Merge opts with the keymap options
        local key_opts = vim.tbl_extend("force", opts, val[2] or {})
        vim.keymap.set(mode, key, val[1], key_opts)
      end
    end
    nvlsp.on_attach(client, bufnr)
  end,
}
