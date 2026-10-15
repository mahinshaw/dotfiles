return {
  {
    "smart-splits-nvim/smart-splits.nvim",
    version = "^3",
    -- must load eagerly: the tmux/kitty backends set @pane-is-vim / IS_NVIM
    -- when the plugin loads, and until then the multiplexer swallows <C-hjkl>
    lazy = false,
    dependencies = {
      { "smart-splits-nvim/backend-tmux", main = "smart-splits-backend-tmux" },
      { "smart-splits-nvim/backend-kitty", main = "smart-splits-backend-kitty" },
    },
    opts = {
      mux = {
        -- tmux first: when running inside tmux-in-kitty, tmux is the inner
        -- multiplexer and owns the neighboring panes
        backend = { "smart-splits-backend-tmux", "smart-splits-backend-kitty" },
      },
    },
    keys = {
      {
        "<C-h>",
        function()
          require("smart-splits").move_cursor_left()
        end,
        desc = "Navigate left pane",
      },
      {
        "<C-j>",
        function()
          require("smart-splits").move_cursor_down()
        end,
        desc = "Navigate bottom pane",
      },
      {
        "<C-k>",
        function()
          require("smart-splits").move_cursor_up()
        end,
        desc = "Navigate top pane",
      },
      {
        "<C-l>",
        function()
          require("smart-splits").move_cursor_right()
        end,
        desc = "Navigate right pane",
      },
      {
        "<A-h>",
        function()
          require("smart-splits").resize_left()
        end,
        desc = "Resize left",
      },
      {
        "<A-j>",
        function()
          require("smart-splits").resize_down()
        end,
        desc = "Resize down",
      },
      {
        "<A-k>",
        function()
          require("smart-splits").resize_up()
        end,
        desc = "Resize up",
      },
      {
        "<A-l>",
        function()
          require("smart-splits").resize_right()
        end,
        desc = "Resize right",
      },
    },
  },
  {
    "mikesmithgh/kitty-scrollback.nvim",
    lazy = true,
    cmd = {
      "KittyScrollbackGenerateKittens",
      "KittyScrollbackCheckHealth",
      "KittyScrollbackGenerateCommandLineEditing",
    },
    event = { "User KittyScrollbackLaunch" },
    config = function()
      require("kitty-scrollback").setup()
    end,
  },
}
