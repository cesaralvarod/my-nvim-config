local config = function()
	local notify = require("notify")

	--setup
	notify.setup({
		background_colour = "#000000",
		notify = {
			clear_time = 3000,
		},
		components = {
			"nvim",
			"lsp",
		},
	})
end

return {
	"rcarriga/nvim-notify",

	config = config,
}
