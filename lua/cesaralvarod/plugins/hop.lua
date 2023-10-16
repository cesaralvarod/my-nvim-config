return {
	"phaazon/hop.nvim",

	cmd = { "HopPattern", "HopLine", "HopWord", "HopVertical", "HopWordCurrentLine" },
	keys = {
		{
			"ff",
			"<cmd>HopPattern<cr>",
		},
		{ "fw", "<cmd>HopWord<cr>" },
		{ "fv", "<cmd>HopVertical<cr>" },
		{ "fl", "<cmd>HopWordCurrentLine<cr>" },
		{ "fll", "<cmd>HopLine<cr>" },
	},
	config = true,
}
