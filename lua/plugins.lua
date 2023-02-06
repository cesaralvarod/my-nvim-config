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
	use("wbthomason/packer.nvim") -- packer

	use("folke/tokyonight.nvim") -- main theme

	use("nvim-tree/nvim-web-devicons") --icons
	use({
		"DaikyXendo/nvim-tree.lua", -- tree files
		requires = {
			"DaikyXendo/nvim-material-icon", -- Material icons
		},
	})
	use({
		"nvim-lualine/lualine.nvim", -- status line
	})
	use({
		"akinsho/bufferline.nvim", -- buferrline in top
		tag = "v3.*",
	})
	use("folke/which-key.nvim") -- which key helper
	use({
		"nvim-treesitter/nvim-treesitter", -- syntax highlight
		requires = {
			"windwp/nvim-ts-autotag", -- tresitter auto close tags
			"p00f/nvim-ts-rainbow", -- treesiter rainbow pairs
			"JoosepAlviste/nvim-ts-context-commentstring", -- treesitter comments, work with Comment.nvim
			"axelvc/template-string.nvim", -- treesitter template string
		},
	})
	use({
		"nvim-telescope/telescope.nvim", -- Fuzzy finder
		requires = {
			"nvim-lua/plenary.nvim",
			"jeetsukumaran/telescope-buffer-lines.nvim",
			"nvim-telescope/telescope-media-files.nvim",
			"xiyaowong/telescope-emoji.nvim",
			"tom-anders/telescope-vim-bookmarks.nvim",
		},
	})
	use("windwp/nvim-autopairs") -- auto close tags
	use("numToStr/Comment.nvim") -- comment our code
	use("rcarriga/nvim-notify") -- notifications top-left screens
	use({
		"lewis6991/gitsigns.nvim", --Super fast git decorations implemented
		-- tag = "release",
	})
	use("nvim-lua/plenary.nvim") -- common utilities
	use("tpope/vim-surround") -- Mappings to delete, change and add such surroundings in pairs
	use("metakirby5/codi.vim") -- Execute code in nvim
	use({ "nvim-lua/popup.nvim", requires = { "nvim-lua/plenary.nvim" } }) -- popup
	use("adelarsq/vim-matchit") -- '%' operator
	use("norcalli/nvim-colorizer.lua") -- color background #fff
	use("tpope/vim-eunuch") -- helpers for vim, example: :Remove :Delete, :Move, :Chmod, etc.
	use("lukas-reineke/indent-blankline.nvim") -- line in tabs
	use("goolord/alpha-nvim") -- dashboard
	use("rmagatti/alternate-toggler") -- toggles the current word () based on a pre-defined map of alternates.
	use("mg979/vim-visual-multi") -- multiple cursor
	use("folke/todo-comments.nvim") -- PERF: HACK: TODO: NOTE: FIX: WARNING:
	use("j-hui/fidget.nvim") -- bottom-right nvim-lsp progress
	use("MattesGroeger/vim-bookmarks") -- bookmarks
	use("theprimeagen/harpoon") -- save buffers
	use("mbbill/undotree") -- tree undo
	use({
		"iamcco/markdown-preview.nvim", -- markdown previewer
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})
	use("sindrets/diffview.nvim") -- single page diff view
	use("phaazon/hop.nvim") -- As easymotion
	use("ibhagwan/fzf-lua") -- Fuzzy finder
	use("matze/vim-move") -- move lines
	use({
		"kkoomen/vim-doge", -- Generate documentation
		run = ":call doge#install()",
	})

	use("williamboman/mason.nvim") -- Install LSP servers
	use("williamboman/mason-lspconfig.nvim") -- Mason config
	use("neovim/nvim-lspconfig") -- LSP Config
	use("ray-x/lsp_signature.nvim") -- LSP dialogs
	use({
		"hrsh7th/nvim-cmp", -- Autocomplete, like Coc
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
		},
	})
	use({
		"L3MON4D3/LuaSnip", -- LSP Snippets
		requires = {
			"rafamadriz/friendly-snippets",
		},
	})
	use("jose-elias-alvarez/null-ls.nvim") -- LSP formatters and linters

	if packer_bootstrap then
		require("packer").sync()
	end
end

-- Load plugins

return require("packer").startup(startup)
