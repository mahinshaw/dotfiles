return {
  {
    "apple/pkl-neovim",
    lazy = true,
    ft = "pkl",
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter",
        build = function(_)
          vim.cmd("TSUpdate")
        end,
      },
      "L3MON4D3/LuaSnip",
      -- {
      --   "mason-org/mason-lspconfig.nvim",
      -- },
    },
    build = function()
      require("pkl-neovim").init()
    end,
    config = function()
      -- Set up snippets.
      require("luasnip.loaders.from_snipmate").lazy_load()

      -- Configure pkl-lsp
      vim.g.pkl_neovim = {
        -- start_command = { "java", "-jar", "/path/to/pkl-lsp.jar" },
        -- or if pkl-lsp is installed with brew:
        start_command = { "pkl-lsp" },
        -- Need to ensure this is installed via mason
        pkl_cli_path = "~/.local/share/nvim/mason/bin/pkl-cli",
      }
    end,
  },
  -- ensure pkl parser is installed for treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "pkl",
      },
    },
  },
  -- Ensure pkl-lsp is installed via mason
  {
    "mason.nvim",
    opts = { ensure_installed = { "pkl-lsp" } },
  },
}
