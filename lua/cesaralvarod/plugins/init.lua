return {
	{
		"nvim-lua/plenary.nvim",
		lazy = false,
		priority = 800,
	},

	{
		"MunifTanjim/prettier.nvim",
		config = true,
		cmd = "Prettier",
	},

	{
		"mtdl9/vim-log-highlighting",
		lazy = true,
	},

	{ "j-hui/fidget.nvim", branch = "legacy", config = true },

	{
		"matze/vim-move",
		keys = {
			{ "<A-h>" },
			{ "<A-j>" },
			{ "<A-k>" },
			{ "<A-l>" },
		},
	},

	{ "gen740/SmoothCursor.nvim", config = true },

	{ "nacro90/numb.nvim", config = true, lazy = false },

	-- { "sheerun/vim-polyglot" },

	{
		"nvim-lua/popup.nvim",
		lazy = false,
		priority = 500,
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{ "tpope/vim-surround" },

	{
		"tpope/vim-eunuch",
		cmd = {
			"Remove",
			"Delete",
			"Move",
			"Rename",
			"Copy",
			"Clocate",
			"Chmod",
			"Mkdir",
			"Cfind",
			"Lfind",
			"Llocate",
			"Walk",
			"SudoWrite",
			"SudoEdit",
		},
	},

	{ "adelarsq/vim-matchit", keys = { "%" } },

	{ "akielaries/vim-s-asm" },
}
