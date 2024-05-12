return {
	{
		"cesaralvarod/tokyogogh.nvim",
		-- dir = "~/workspace/tokyogogh.nvim",
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme tokyogogh]])
		end,
	},

	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,

		config = function()
			require("tokyonight").setup({
				style = "storm",
				light_style = "day",
			})
		end,
	},
}
