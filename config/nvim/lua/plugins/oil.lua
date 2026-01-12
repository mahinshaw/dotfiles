return {
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      keymaps = {
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
