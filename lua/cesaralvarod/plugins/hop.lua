return {
	"phaazon/hop.nvim",
	config = true,
	cmd = { "HopPattern", "HopWord", "HopVertical" },
	keys = {
		{
			"ff",
			"<cmd>HopPattern<cr>",
		},
		{ "fw", "<cmd>HopWord<cr>" },
		{ "fv", "<cmd>HopVertical<cr>" },
	},
}
