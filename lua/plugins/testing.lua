return {

  { "nvim-neotest/neotest-python" },
  {
    "nvim-neotest/neotest",
    ft = { "python" },
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require "configs.neotest"
    end,
  },
}
