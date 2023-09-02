return {
	"utilyre/barbecue.nvim",
	--branch = "fix/E36", -- NOTE: 👀 barbecue branch resolve error Vim E36, see later if in realease is fixing
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local icons = require("cesaralvarod.config.icons")

		require("barbecue").setup({
			show_dirname = false,
			kinds = icons.kind,
		})
	end,
}
