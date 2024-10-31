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
  },
}

for mode, maps in pairs(mappings) do
  for key, val in pairs(maps) do
    vim.keymap.set(mode, key, val[1], val[2])
  end
end
