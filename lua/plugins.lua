-- Plugin definition and loading

-- Packer init

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

local startup = function(use)
	---------------------------------------------------------------
	-- Packer
	---------------------------------------------------------------
	use("wbthomason/packer.nvim")

	---------------------------------------------------------------
	-- Theme: Tokyonight
	---------------------------------------------------------------
	use("folke/tokyonight.nvim")

	---------------------------------------------------------------
	-- Nvim Tree -> Search bar files
	---------------------------------------------------------------
	use({
		-- "nvim-tree/nvim-tree.lua", -- Original
		"DaikyXendo/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- for file icons
			"DaikyXendo/nvim-material-icon", -- Material icons
		},
		-- tag = "nightly", -- optional, updated every week. (see issue #1193)
	})

	---------------------------------------------------------------
	-- Lualine -> Status line
	---------------------------------------------------------------
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	---------------------------------------------------------------
	-- Bufferline -> Buffer line in top
	---------------------------------------------------------------
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })

	---------------------------------------------------------------
	-- Which key -> Help for write a command in nvim terminal
	---------------------------------------------------------------
	use("folke/which-key.nvim")

	---------------------------------------------------------------
	-- Nvim Treesitter
	---------------------------------------------------------------
	use({
		"nvim-treesitter/nvim-treesitter",
		requires = {
			"windwp/nvim-ts-autotag",
			"p00f/nvim-ts-rainbow",
			"axelvc/template-string.nvim",
		},
	})

	---------------------------------------------------------------
	-- LSP
	---------------------------------------------------------------
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	}) -- Configurations for Nvim LSP

	-- Dialogs
	use({
		"ray-x/lsp_signature.nvim",
	})

	-- Completion
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"neovim/nvim-lspconfig",
		},
	})

	-- For LuaSnip users
	use("saadparwaiz1/cmp_luasnip")
	use({
		"L3MON4D3/LuaSnip",
		requires = {
			"rafamadriz/friendly-snippets",
		},
	})

	-- Format

	use("jose-elias-alvarez/null-ls.nvim") -- > Inject LSP diagnostics, code actions, and more via Lua.

	---------------------------------------------------------------
	-- Telescope
	---------------------------------------------------------------
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"jeetsukumaran/telescope-buffer-lines.nvim",
			"nvim-telescope/telescope-media-files.nvim",
			"xiyaowong/telescope-emoji.nvim",
			"tom-anders/telescope-vim-bookmarks.nvim",
		},
	})

	---------------------------------------------------------------
	-- Autopairs -> Autoclose <, ", ', (, [, {
	---------------------------------------------------------------
	use("windwp/nvim-autopairs")

	---------------------------------------------------------------
	-- Comment -> Make comments in the code
	---------------------------------------------------------------
	use("numToStr/Comment.nvim")

	---------------------------------------------------------------
	-- Notify -> Notifications top-left neovim
	---------------------------------------------------------------
	use("rcarriga/nvim-notify")

	---------------------------------------------------------------
	-- Gitsigns -> Super fast git decorations implemented purely in lua/teal.
	---------------------------------------------------------------
	use({
		"lewis6991/gitsigns.nvim",
		-- tag = "release",
	})

	---------------------------------------------------------------
	-- Vim-surround -> This plugin provides mappings to easily delete, change and add such surroundings in pairs.
	---------------------------------------------------------------
	use("tpope/vim-surround")

	---------------------------------------------------------------
	-- Codi
	---------------------------------------------------------------
	use("metakirby5/codi.vim")

	---------------------------------------------------------------
	-- Vim-sneak -> Este plugin sirve para moverte más rápido por la pantalla
	---------------------------------------------------------------
	use("justinmk/vim-sneak")

	---------------------------------------------------------------
	-- Sniprun
	---------------------------------------------------------------
	use({ "michaelb/sniprun", run = "bash ./install.sh" })

	---------------------------------------------------------------
	-- Vim Rainbow
	---------------------------------------------------------------
	use("frazrepo/vim-rainbow")

	---------------------------------------------------------------
	-- Popup.nvim
	---------------------------------------------------------------
	use({ "nvim-lua/popup.nvim", requires = { "nvim-lua/plenary.nvim" } })

	---------------------------------------------------------------
	-- Vim-matchit -> '%' operator... go to close pair
	---------------------------------------------------------------
	use("adelarsq/vim-matchit")

	---------------------------------------------------------------
	-- Colorizer -> #454545 #89f652
	---------------------------------------------------------------
	use("norcalli/nvim-colorizer.lua")

	---------------------------------------------------------------
	-- Eunuch -> Helpers for vim, example: :Remove :Delete, :Move, :Chmod, etc.
	---------------------------------------------------------------
	use("tpope/vim-eunuch")

	---------------------------------------------------------------
	-- Ident Blankline -> line in tabs
	---------------------------------------------------------------
	use("lukas-reineke/indent-blankline.nvim")

	---------------------------------------------------------------
	-- Alpha -> Dashboard
	---------------------------------------------------------------
	use({
		"goolord/alpha-nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
	})

	---------------------------------------------------------------
	-- Alternate toggler -> toggles the current word () based on a pre-defined map of alternates.
	---------------------------------------------------------------
	use("rmagatti/alternate-toggler")

	---------------------------------------------------------------
	-- Visual multi -> multiple cursors
	---------------------------------------------------------------
	use("mg979/vim-visual-multi")

	---------------------------------------------------------------
	-- TODO comments
	---------------------------------------------------------------
	-- PERF: message
	-- HACK: message
	-- TODO: message
	-- NOTE: message
	-- FIX: message
	-- WARNING: message
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
	})

	---------------------------------------------------------------
	-- Fidget -> Standalone UI for nvim-lsp progress. Eye candy for the impatient.
	---------------------------------------------------------------
	use("j-hui/fidget.nvim")

	---------------------------------------------------------------
	-- Bookmarks
	---------------------------------------------------------------
	use("MattesGroeger/vim-bookmarks")

	-------------------------------------------------------------

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end

-- Load plugins

return require("packer").startup(startup)
