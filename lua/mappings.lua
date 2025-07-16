require "nvchad.mappings"

-- add yours here

local mappings = {
  n = {
    -- Notifications
    ["<leader>nd"] = {
      "<cmd> Noice dismiss <CR>",
      {
        desc = "Dismiss all Notifications",
      },
    },
    ["<leader>nt"] = {
      "<cmd> Noice telescope <CR>",
      {
        desc = "Display all Notifications",
      },
    },

    -- VS Tasks
    ["<leader>tva"] = {
      "<cmd>lua require('configs.vstask').show_tasks()<CR>",
      {
        desc = "Show tasks",
      },
    },
    ["<leader>tvi"] = {
      "<cmd>lua require('configs.vstask').show_inputs()<CR>",
      {
        desc = "Task inputs",
      },
    },
    ["<leader>tvj"] = {
      "<cmd>lua require('configs.vstask').show_jobs()<CR>",
      {
        desc = "View jobs",
      },
    },
    ["<leader>tvr"] = {
      "<cmd>lua require('telescope').extensions.vstask.run()<CR>",
      {
        desc = "Run command",
      },
    },
  },
}

for mode, maps in pairs(mappings) do
  for key, val in pairs(maps) do
    vim.keymap.set(mode, key, val[1], val[2])
  end
end
