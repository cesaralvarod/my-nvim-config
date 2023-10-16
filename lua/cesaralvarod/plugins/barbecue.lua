local config = function()
	local barbecue = require("barbecue")

	local icons = require("cesaralvarod.config.icons")

	-- setup
	barbecue.setup({
		show_dirname = true,
		kinds = icons.kind,
	})
end

return {
	"utilyre/barbecue.nvim",
	version = "*",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons", -- optional dependency
	},

	priority = 200,
	config = config,
}
