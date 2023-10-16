return {
	"VonHeikemen/searchbox.nvim",
	dependencies = {
		{ "MunifTanjim/nui.nvim" },
	},

	cmd = { "SearchBoxSimple", "SearchBoxReplace", "SearchBoxMatchAll" },
	keys = {
		{
			"<leader>s",
			"<cmd>SearchBoxSimple<cr>",
			desc = "Search Box Simple",
		},
		{
			"<leader>sr",
			"<cmd>SearchBoxReplace<cr>",
			desc = "Search Box Simple",
		},
		{
			"<leader>sm",
			"<cmd>SearchBoxMatchAll<cr>",
			desc = "Search Box Match All",
		},
	},
	config = true,
}
