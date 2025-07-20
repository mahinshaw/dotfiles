-- I don't use jump tools a lot. And I use s to delete a letter an go into insert mode a lot.
-- Let's clear the bindings that exist and add back a `<leader>j` section for jump commands.
return {
  "folke/flash.nvim",
  -- returning the function clears out existing keymaps https://www.lazyvim.org/configuration/plugins#%EF%B8%8F-adding--disabling-plugin-keymaps
  keys = function()
    return {
      {
        "<leader>js",
        mode = { "n", "x" },
        function()
          require("flash").jump()
        end,
        desc = "Flash Jump",
      },
      {
        "<leader>jS",
        mode = { "n", "x" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "<leader>jr",
        mode = { "n", "x" },
        function()
          require("flash").remote()
        end,
        desc = "Flash Remote",
      },
      {
        "<leader>jR",
        mode = { "n", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Flash Treesitter Search",
      },
      {
        -- keep the standard toggle because it's for using normal search and then toggling that search to flash
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    }
  end,
}
