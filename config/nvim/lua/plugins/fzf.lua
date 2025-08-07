return {
  {
    "ibhagwan/fzf-lua", -- optional
    keys = {
      -- lazy vim bindings -> https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/extras/editor/fzf.lua#L208
      { "<leader>fl", "<cmd>FzfLua blines<cr>", desc = "Search lines in current buffer." },
      { "<leader>fL", "<cmd>FzfLua lines<cr>", desc = "Search lines in open buffers." },
    },
  },
}
