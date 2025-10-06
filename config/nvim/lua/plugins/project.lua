-- Taken from https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/extras/util/project.lua

local pick = nil

pick = function()
  require("project").run_fzf_lua()
end

return {
  {
    "DrKJeff16/project.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      -- Only one of these is needed.
      "ibhagwan/fzf-lua", -- optional
      -- "folke/snacks.nvim",  -- optional
    },
    opts = {
      manual_mode = false,
      fzf_lua = { enabled = true },
    },
    event = "VeryLazy",
    config = function(_, opts)
      require("project").setup(opts)
      local history = require("project.utils.history")
      history.delete_project = function(project)
        for k, v in pairs(history.recent_projects) do
          if v == project.value then
            history.recent_projects[k] = nil
            return
          end
        end
      end
    end,
  },

  {
    "ibhagwan/fzf-lua",
    optional = true,
    keys = {
      { "<leader>fp", pick, desc = "Projects" },
    },
  },
  {
    "folke/snacks.nvim",
    optional = true,
    opts = function(_, opts)
      table.insert(opts.dashboard.preset.keys, 3, {
        action = pick,
        desc = "Projects",
        icon = " ",
        key = "p",
      })
    end,
  },
}
