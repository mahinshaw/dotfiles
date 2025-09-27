return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      {
        "sindrets/diffview.nvim",
      }, -- optional - Diff integration
      -- Only one of these is needed.
      "ibhagwan/fzf-lua", -- optional
      -- "folke/snacks.nvim",             -- optional
    },
    keys = {
      { "<leader>G", mode = "n", "<cmd>Neogit<cr>", desc = "Open Neogit" },
      -- { "<leader>gd", mode = "n", "<cmd>Neogit kind=diff<cr>", desc = "Open Neogit diff" },
      -- { "<leader>gc", mode = "n", "<cmd>Neogit kind=commit<cr>", desc = "Open Neogit commit" },
    },
  },
  {
    "sindrets/diffview.nvim",
    opts = {
      keymaps = {
        view = {
          { "n", "q", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
        },
        file_panel = {
          { "n", "q", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
        },
      },
    },
  },
}
