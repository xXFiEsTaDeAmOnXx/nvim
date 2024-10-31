local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    tex = { "latexindent" },
    yaml = { "yamlfix" },
    python = { "black" },
    c = { "clang-format" },
    cpp = { "clang-format" },
  },

  format_on_save = {
    --   -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
