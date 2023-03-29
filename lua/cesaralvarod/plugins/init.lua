return {
	{
		"nvim-lua/plenary.nvim",
		lazy = false,
		priority = 800,
	},
	{
		"MunifTanjim/prettier.nvim",
		config = function()
			local prettier = require("prettier")

			prettier.setup({
				bin = "prettier",
			})
		end,
	},
	{
		"mtdl9/vim-log-highlighting",
		lazy = true,
	},
	{
		"esensar/nvim-dev-container",
		lazy = true,
	},
	{ "j-hui/fidget.nvim", config = true },
}
