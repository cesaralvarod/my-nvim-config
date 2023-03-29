return {
	"VonHeikemen/searchbox.nvim",
	dependencies = {
		{ "MunifTanjim/nui.nvim" },
	},
	config = true,
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
}
