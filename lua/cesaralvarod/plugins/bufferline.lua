local config = function()
	local icons = require("cesaralvarod.config.icons")

	local bufferline = require("bufferline")

	-- options
	local opts = {
		options = {
			theme = "auto", -- theme auto
			mode = "buffers", -- buffers|tabs
			numbers = "none", -- disable numbers
			indicator_icon = nil,
			indicator = {
				style = "icon",
				icons.ui.BoldLineLeft,
			},
			buffer_close_icon = icons.ui.Close,
			modified_icon = icons.ui.Circle,
			close_icon = icons.ui.BoldClose,
			left_trunc_marker = icons.ui.ArrowCircleLeft,
			right_trunc_marker = icons.ui.ArrowCircleRight,
			max_name_length = 30,
			max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
			tab_size = 21,
			offsets = {
				{ filetype = "NvimTree", text = "", padding = 1 },
			},
			color_icons = true,
			show_buffer_icons = true, -- buffer icons
			show_buffer_close_icons = true, -- buffer close icon
			show_close_icon = true, -- close icon
			show_tab_indicators = true, -- tab indicator
			show_duplicate_prefix = true,
			persist_buffer_sort = true,
			separator_style = "thin", -- separator
			enforce_regular_tabs = true,
			always_show_bufferline = true,
			diagnostics = "nvim_lsp",
			view = {
				adaptive_size = false,
			},
		},
	}

	-- setup
	bufferline.setup(opts)
end

return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	priority = 200,
	config = config,
}
