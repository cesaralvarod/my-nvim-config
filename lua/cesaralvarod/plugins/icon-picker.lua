return {
	"ziontee113/icon-picker.nvim",
	config = function()
		require("icon-picker").setup({
			disable_legacy_commands = true,
		})
	end,
	cmd = "IconPickerNormal",
	keys = {
		{ "<leader><leader>i", "<cmd>IconPickerNormal<cr>" },
	},
}
