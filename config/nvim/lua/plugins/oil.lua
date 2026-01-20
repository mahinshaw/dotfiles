return {
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      columns = {
        "icon",
        -- "permissions",
        -- "size",
        -- "mtime",
      },
      keymaps = {
        ["gd"] = {
          desc = "Toggle file detail view",
          callback = function()
            oil_detail = not oil_detail
            if oil_detail then
              require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
            else
              require("oil").set_columns({ "icon" })
            end
          end,
        },
        ["q"] = { "actions.close", mode = "n" },
        -- don't use C-s for splits.
        ["<C-s>"] = false,
        ["<C-r>"] = "actions.refresh",
        ["vv"] = { "actions.select", opts = { vertical = true } },
        ["ss"] = { "actions.select", opts = { horizontal = true } },
        -- Remap to not override split navigation
        ["<C-h>"] = false,
        ["<C-l>"] = false,
      },
    },
    -- Optional dependencies
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    keys = {
      { "-", mode = "n", "<CMD>Oil<CR>", desc = "Open Oil" },
    },
  },
}
