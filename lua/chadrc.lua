-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "onedark",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },

  hl_add = { -- add highlights to use for vimtex status
    St_vtexInfo = { fg = "#61afef", bg = "NONE" },
    St_vtexIdle = { fg = "#b294bb", bg = "NONE" },
    St_vtexSuccess = { fg = "#98c379", bg = "NONE" },
    St_vtexError = { fg = "#e06c75", bg = "NONE" },
  },
}

M.ui = {
  statusline = {
    theme = "default",
    separator_style = "default",
    order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "vtex", "diagnostics", "lsp", "cwd", "cursor" },
    modules = {
      vtex = function()
        if vim.b.vimtex then
          local status = vim.b.vimtex.compiler.status + 2

          local symbols_and_colors = { -- use highlights specifiged ad the top and symbol
            { "[⏻] ", "%#St_vtexInfo#" },
            { "[⏻] ", "%#St_vtexInfo#" },
            { "[⟳] ", "%#St_vtexIdle#" },
            { "[✔︎] ", "%#St_vtexSuccess#" },
            { "[✖] ", "%#St_vtexError#" },
          }
          local status_symbol = symbols_and_colors[status][1]
          local color = symbols_and_colors[status][2]
          return color .. status_symbol -- parse color string toghter to get specified color
        end
        return ""
      end,
    },
  },
}

M.mason = {
  cmd = true,
  pkgs = { -- put your mason packges here
    "stylua", -- Lua fotmater
    "rust-analyzer", -- Rust Lsp
    "clangd", -- CPP LSP
    "clang-format", -- CPP Formatter
    "codelldb", -- Debugger
    "pyright", -- Python Static Type checker
    "black", -- Python Formatter
    "isort", -- Python input Formater
    "python-lsp-server", -- Python LSP
    "debugpy", -- Python Debugger
    "ltex-ls", -- Spelling LSP
    "latexindent", -- LaTeX formatter
    "yamlfix", -- Yaml Formatter
    "yaml-language-server", -- Yaml LSP
    "json-lsp", -- JSON LSP
    "dockerfile-language-server", -- Dockerfile LSP
    "docker-compose-language-service", -- Compose LSP
    "hyprls", -- Hyprland Lsp
    "rustfmt", --rust Formater
  },
}

return M
