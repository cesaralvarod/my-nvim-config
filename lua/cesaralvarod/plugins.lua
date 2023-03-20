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
	use("rebelot/kanagawa.nvim")

	use("nvim-tree/nvim-web-devicons") --icons
	use({
		"DaikyXendo/nvim-tree.lua", -- tree files
		requires = {
			"DaikyXendo/nvim-material-icon", -- Material icons
		},
	})
	use("mtdl9/vim-log-highlighting") -- .log files highlight
	use("nacro90/numb.nvim") -- peek line
	use({
		"VonHeikemen/searchbox.nvim", -- search and replace words in current buffer
		requires = {
			{ "MunifTanjim/nui.nvim" },
		},
	})
	use({
		"NTBBloodbath/rest.nvim", -- Like postman
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	use({
		"nvim-lualine/lualine.nvim", -- status line
	})
	use({
		"akinsho/bufferline.nvim", -- buferrline in top
		tag = "v3.*",
	})
	use("sheerun/vim-polyglot")
	use({
		"utilyre/barbecue.nvim", -- Breadcrumbs with nvim-navic
		branch = "fix/E36", -- NOTE: 👀 barbecue branch resolve error Vim E36, see later if in realease is fixing
		requires = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons",
		},
	})
	use("gen740/SmoothCursor.nvim") -- Cursor position
	use("ziontee113/color-picker.nvim") -- Color picker
	use("tpope/vim-fugitive") -- :G helper for git
	use("nvim-pack/nvim-spectre") -- search panel
	use("esensar/nvim-dev-container") -- docker devcontainer like vscode extension
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
			"nvim-telescope/telescope-file-browser.nvim", -- command file_browser
			-- "nvim-telescope/telescope-dap.nvim",
			-- "nvim-telescope/telescope-ui-select.nvim",
			"lpoto/telescope-docker.nvim", -- docker plugin
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
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
	use({
		"SmiteshP/nvim-navic",
		requires = {
			"neovim/nvim-lspconfig",
		},
	})
	use("phaazon/hop.nvim") -- As easymotion
	use("ibhagwan/fzf-lua") -- Fuzzy finder
	use("matze/vim-move") -- move lines
	use("stevearc/dressing.nvim") -- better ui
	use("ziontee113/icon-picker.nvim") -- icon picker
	use({
		"kkoomen/vim-doge", -- Generate documentation
		run = ":call doge#install()",
	})

	use("neovim/nvim-lspconfig") -- Default config
	use("williamboman/mason.nvim") -- Install LSP servers
	use("williamboman/mason-lspconfig.nvim") -- Mason config
	use({
		"hrsh7th/nvim-cmp", -- Autocomplete, like Coc
		requires = {
			"hrsh7th/cmp-nvim-lsp", -- Autocomplete lsp
			"hrsh7th/cmp-nvim-lua", -- Autocomplete lua global variables (vim)
			"hrsh7th/cmp-buffer", -- Autcomplet buffer
			"hrsh7th/cmp-emoji", -- Autocomplete emojis
			"hrsh7th/cmp-path", -- Autocomplete paths
			"hrsh7th/cmp-cmdline", -- Autocomplete cmdline
			"hrsh7th/cmp-nvim-lsp-signature-help", -- Autocomplete signatures
			"kdheepak/cmp-latex-symbols", -- Autocomplete symbols
			"saadparwaiz1/cmp_luasnip", -- Autocomplete snippets
			"petertriho/cmp-git", -- Autocomplete git
			{ "tzachar/cmp-tabnine", run = "./install.sh" },
		},
	})
	use("folke/neodev.nvim") -- vim api lsp helpers for neovim plugins development
	use({
		"L3MON4D3/LuaSnip", -- LSP Snippets
		requires = {
			"rafamadriz/friendly-snippets", -- Snippets
		},
	})
	use("jose-elias-alvarez/null-ls.nvim") -- LSP formatters and linters
	use("MunifTanjim/prettier.nvim") -- Prettier

	if packer_bootstrap then
		require("packer").sync()
	end
end

-- Load plugins

return require("packer").startup(startup)
