return {
  { "folke/lazy.nvim", version = false },
  {
    "folke/snacks.nvim",
    version = false,
    opts = {
      picker = {
        hidden = true,
        ignore = true,
        sources = { files = { show_unindexed = true, hidden = true, ignore = true } },
      },
    },
  },
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
    -- CQL support for Cassandra queries
    "elubow/cql-vim",
  },
}
