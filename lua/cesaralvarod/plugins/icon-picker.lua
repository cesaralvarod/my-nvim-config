local config = function()
	local picker = require("icon-picker")

	-- setup
	picker.setup({
		disable_legacy_commands = true,
	})
end

return {
	"ziontee113/icon-picker.nvim",

	cmd = "IconPickerNormal",
	keys = {
		{ "<leader><leader>i", "<cmd>IconPickerNormal<cr>" },
	},
	config = config,
}
