return {
	"rcarriga/nvim-notify",
	lazy = false,
	config = function()
		require("notify").setup({
			background_colour = "#000000",
			notify = {
				clear_time = 3000,
			},
			components = {
				"nvim",
				"lsp",
			},
		})
	end,
}
