require "nvchad.options"

vim.opt.spelllang = "de,en"
vim.opt.spell = true

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
  },
}
