return {
  {
    "mrjones2014/smart-splits.nvim",
    -- installs the neighboring_window/relative_resize/split_window kittens
    -- into ~/.config/kitty, required for the kitty multiplexer integration
    build = "./kitty/install-kittens.bash",
    -- must load eagerly: tmux/kitty integration relies on the
    -- @pane-is-vim / IS_NVIM variable being set as soon as Neovim starts
    event = "VeryLazy",
    keys = {
      { "<C-h>", function() require("smart-splits").move_cursor_left() end, desc = "Navigate left pane" },
      { "<C-j>", function() require("smart-splits").move_cursor_down() end, desc = "Navigate bottom pane" },
      { "<C-k>", function() require("smart-splits").move_cursor_up() end, desc = "Navigate top pane" },
      { "<C-l>", function() require("smart-splits").move_cursor_right() end, desc = "Navigate right pane" },
      { "<A-h>", function() require("smart-splits").resize_left() end, desc = "Resize left" },
      { "<A-j>", function() require("smart-splits").resize_down() end, desc = "Resize down" },
      { "<A-k>", function() require("smart-splits").resize_up() end, desc = "Resize up" },
      { "<A-l>", function() require("smart-splits").resize_right() end, desc = "Resize right" },
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
