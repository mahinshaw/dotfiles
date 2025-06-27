return {
  { "folke/lazy.nvim", version = false },
  {
    "LazyVim/LazyVim",
    version = false,
    opts = {
      colorscheme = "sonokai", -- set your default colorscheme here
    },
  },
  { "sainnhe/sonokai" },
  { "rebelot/kanagawa.nvim" },
  {
    "swaits/zellij-nav.nvim",
    -- lazy = true,
    -- event = "VeryLazy",
    keys = {
      { "<c-h>", "<cmd>ZellijNavigateLeftTab<cr>", { silent = true, desc = "navigate left or tab" } },
      { "<c-j>", "<cmd>ZellijNavigateDown<cr>", { silent = true, desc = "navigate down" } },
      { "<c-k>", "<cmd>ZellijNavigateUp<cr>", { silent = true, desc = "navigate up" } },
      { "<c-l>", "<cmd>ZellijNavigateRightTab<cr>", { silent = true, desc = "navigate right or tab" } },
    },
    opts = {},
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

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
    -- CQL support for Cassandra queries
    "elubow/cql-vim",
  },
}
