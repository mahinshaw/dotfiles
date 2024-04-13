vim.o.number = true   -- Line numbers are good
vim.o.smartindent = true
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.expandtab = true

vim.o.wrap = false

-- scroll
vim.o.scrolloff = 8
vim.o.sidescrolloff = 15
vim.o.sidescroll = 1

-- search
vim.o.ignorecase = true
vim.o.smartcase = true

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = ","

-- mappings
vim.keymap.set('n', 'vv', '<C-w>v')
vim.keymap.set('n', 'ss', '<C-w>s')

vim.keymap.set('n', '//', ':nohlsearch<cr>', { silent = true })

vim.keymap.set('n', '<leader>fed', ':e ~/.config/nvim/init.lua<cr>')

-- Setup lazy https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 
require("lazy").setup({
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = true,
		opts = ...,
		init = function()
			vim.o.background = 'dark'
			vim.cmd([[colorscheme gruvbox]])
		end
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function ()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			-- config here
		}
	},
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ 'nvim-telescope/telescope.nvim', tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim'},
	init = function () 
		-- Mappings
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
		vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
	end,
	},
	{
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
		theme = 'gruvbox'
	}
	}
	,
	{ "alexghergh/nvim-tmux-navigation" },
  {"williamboman/mason.nvim",
  init = function()
    -- setup
  end,
  },
  "williamboman/mason-lspconfig.nvim",
  {"neovim/nvim-lspconfig", dependencies = {"williamboman/mason-lspconfig.nvim"},
  init = function()
    -- setup
    local lspconfig = require("lspconfig")
    local mason = require("mason")

    mason.setup()

    lspconfig.rust_analyzer.setup({})
    lspconfig.tsserver.setup({})
    
    -- Global mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>f', function()
          vim.lsp.buf.format { async = true }
        end, opts)
      end,
    })
  end
},

-- { "folke/neoconf.nvim", cmd = "Neoconf" },
-- "folke/neodev.nvim",
})

