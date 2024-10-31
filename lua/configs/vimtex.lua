vim.g.vimtex_mappings_enabled = 0
vim.g.vimtex_view_general_viewer = "zathura_simple"
vim.g.vimtex_view_method = "zathura_simple"
vim.g.vimtex_compiler_method = "latexmk"
vim.g.vimtex_compiler_latexmk = {
  callback = 1,
  continuous = 1,
  executable = vim.fn.expand "~" .. "/.config/nvim/latex/latexmk",
  options = {
    "-shell-escape",
    "-verbose",
    "-file-line-error",
    "-synctex=1",
    "-interaction=nonstopmode",
  },
}
vim.g.vimtex_quickfix_mode = 0
vim.g.vimtex_fold_enabled = 0
