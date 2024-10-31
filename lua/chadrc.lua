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
    "rustfmt",
  },
}

return M
