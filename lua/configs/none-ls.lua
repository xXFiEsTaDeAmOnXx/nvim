local null_ls = require "null-ls"
local augroup = vim.api.nvim_create_augroup("LspFromating", {})

local opts = {
  sources = {
    null_ls.builtins.formatting.clang_format,
    null_ls.builtins.formatting.black,
  },
  on_attach = function(clinet, bufnr)
    if clinet.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
    end
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format { bufnr = bufnr }
      end,
    })
  end,
}

return opts
