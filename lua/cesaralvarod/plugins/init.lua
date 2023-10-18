return {
	{
		"nvim-lua/plenary.nvim",
		lazy = false,
		priority = 800,
	},

	{
		"mtdl9/vim-log-highlighting",
		lazy = true,
	},

	{ "nacro90/numb.nvim", config = true },

	{
		"nvim-lua/popup.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		priority = 500,
	},

	{ "adelarsq/vim-matchit", keys = { "%" } },
}
