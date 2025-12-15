require "nvchad.options"

vim.opt.spell = false

vim.o.relativenumber = true
vim.o.foldenable = false -- Dont fold on File-Open
vim.o.foldlevel = 99 -- Start with all folds open

vim.api.nvim_create_autocmd({ "FileType" }, {
  callback = function()
    if pcall(vim.treesitter.get_parser) then
      vim.opt_local.foldmethod = "expr"
      vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    else
      vim.opt_local.foldmethod = "syntax"
    end
  end,
})

-- Command to disable formatting
vim.api.nvim_create_user_command("FormatDisable", function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true

    vim.notify("Autoformat disabled in buffer", vim.log.levels.INFO)
  else
    vim.g.disable_autoformat = true

    vim.notify("Autoformat disabled gobal", vim.log.levels.INFO)
  end
end, {
  desc = "Disable autoformat-on-save",
  bang = true,
})

-- Command to enable formatting
vim.api.nvim_create_user_command("FormatEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
  vim.notify("Autoformat enabled", vim.log.levels.INFO)
end, {
  desc = "Enable autoformat-on-save",
})

vim.filetype.add {
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
}

vim.filetype.add {
  filename = {
    ["docker-compose.yaml"] = "yaml.docker-compose",
    ["docker-compose.yml"] = "yaml.docker-compose", -- handle both extensions
    pattern = {
      -- match any path that ends with something like *compose*.yml or *compose*.yaml
      [".*compose.*%.ya?ml"] = "yaml.docker-compose",
    },
  },
}
