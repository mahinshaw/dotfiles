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
    "aserowy/tmux.nvim",
    keys = {
      { "<C-h>", mode = "n", "<cmd>lua require'tmux'.move_left()<cr>", desc = "Navigate left pane" },
      { "<C-j>", mode = "n", "<cmd>lua require'tmux'.move_bottom()<cr>", desc = "Navigate bottom pane" },
      { "<C-k>", mode = "n", "<cmd>lua require'tmux'.move_top()<cr>", desc = "Navigate top pane" },
      { "<C-l>", mode = "n", "<cmd>lua require'tmux'.move_right()<cr>", desc = "Navigate right pane" },
    },
    opts = {
      copy_sync = {
        enable = true,
        sync_clipboard = true,
      },
      navigation = {
        cycle_navigation = true,
        enable_default_keybindings = true,
        persist_zoom = false,
      },
      resize = {
        enable_default_keybindings = true,
        -- sets resize steps for x axis
        resize_step_x = 1,
        -- sets resize steps for y axis
        resize_step_y = 1,
      },
      swap = {
        enable_default_keybindings = false,
      },
    },
  },
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
    -- CQL support for Cassandra queries
    "elubow/cql-vim",
  },
}
