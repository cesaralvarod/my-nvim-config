local config = function()
	local picker = require("color-picker")

	-- options
	local opts = {
		["icons"] = { "", "ﰕ" },
	}

	-- setup
	picker.setup(opts)
end

return {
	"ziontee113/color-picker.nvim",

	cmd = "PickColorInsert",
	config = config,
}
