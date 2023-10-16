local config = function()
	local alternate = require("alternate-toggler")

	-- setup
	alternate.setup({
		alternates = {
			["=="] = "!=",
			["==="] = "!==",
		},
		event = { "BufReadPost" },
	})
end

return {
	"rmagatti/alternate-toggler",

	config = config,
	-- mappings
	keys = {
		-- Alternate Toggler
		{
			"<leader><space>",
			"<cmd>lua require('alternate-toggler').toggleAlternate()<CR>",
			mode = "n",
			desc = "Alternate Toggler",
		},
	},
}
