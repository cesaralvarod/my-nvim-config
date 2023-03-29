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

	{ "j-hui/fidget.nvim", config = true },

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

	{ "sheerun/vim-polyglot" },

	{ "tpope/vim-fugitive" },
}
