return {
	"rmagatti/alternate-toggler",
	config = function()
		require("alternate-toggler").setup({
			alternates = {
				["=="] = "!=",
				["==="] = "!==",
			},
			event = { "BufReadPost" },
		})
	end,
	keys = {
		{
			"<leader><space>",
			"<cmd>lua require('alternate-toggler').toggleAlternate()<CR>",
		},
	},
}
