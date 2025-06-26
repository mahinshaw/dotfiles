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
  -- {
  --   "aserowy/tmux.nvim",
  --   keys = {
  --     { "<C-h>", mode = "n", "<cmd>lua require'tmux'.move_left()<cr>", desc = "Navigate left pane" },
  --     { "<C-j>", mode = "n", "<cmd>lua require'tmux'.move_bottom()<cr>", desc = "Navigate bottom pane" },
  --     { "<C-k>", mode = "n", "<cmd>lua require'tmux'.move_top()<cr>", desc = "Navigate top pane" },
  --     { "<C-l>", mode = "n", "<cmd>lua require'tmux'.move_right()<cr>", desc = "Navigate right pane" },
  --     { "<A-h>", mode = "n", "<cmd>lua require'tmux'.resize_left()<cr>", desc = "Resize pane left" },
  --     { "<A-j>", mode = "n", "<cmd>lua require'tmux'.resize_bottom()<cr>", desc = "Resize pane bottom" },
  --     { "<A-k>", mode = "n", "<cmd>lua require'tmux'.resize_top()<cr>", desc = "Resize pane top" },
  --     { "<A-l>", mode = "n", "<cmd>lua require'tmux'.resize_right()<cr>", desc = "Resize pane right " },
  --   },
  --   config = function()
  --     return require("tmux").setup({
  --       copy_sync = {
  --         enable = true,
  --         sync_clipboard = true,
  --       },
  --       navigation = {
  --         cycle_navigation = true,
  --         enable_default_keybindings = true,
  --         persist_zoom = false,
  --       },
  --       resize = {
  --         enable_default_keybindings = false,
  --       },
  --       swap = {
  --         enable_default_keybindings = false,
  --       },
  --     })
  --   end,
  -- },
  {
    "SuperBo/fugit2.nvim",
    build = false,
    opts = {
      width = 100,
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
      {
        "chrisgrieser/nvim-tinygit", -- optional: for Github PR view
        dependencies = { "stevearc/dressing.nvim" },
      },
    },
    cmd = { "Fugit2", "Fugit2Diff", "Fugit2Graph" },
    keys = {
      { "<leader>G", mode = "n", "<cmd>Fugit2<cr>", desc = "Open fugit2" },
    },
  },
}
