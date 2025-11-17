-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_augroup("FiletypeMappings", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = "FiletypeMappings",
  -- For some reason file extension patterns are not working here, so using filetypes instead
  pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  callback = function()
    vim.keymap.set("i", "<C-l>", "=> ", { buffer = true })
  end,
})
