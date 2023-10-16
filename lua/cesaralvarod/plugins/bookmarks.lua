return {
	"MattesGroeger/vim-bookmarks",

	-- mappings
	keys = {
		-- show all bookmarks
		{
			"ma",
			"<cmd>lua require('telescope').extensions.vim_bookmarks.all()<CR>",
		},
	},
}
