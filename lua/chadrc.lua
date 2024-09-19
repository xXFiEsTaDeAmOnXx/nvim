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

M.mason.pkgs = { -- put your mason packges here
  "sumneko_lua",
  "stylua",
  "rust-analyzer",
  "clangd",
  "clang-format",
  "pyright",
  "mypy",
  "black",
  "ruff-lsp",
}

return M
