local config = function()
	local icons = require("cesaralvarod.config.icons")
	require("bufferline").setup({
		options = {
			theme = "auto",
			mode = "buffers",
			numbers = "none",
			indicator_icon = nil,
			indicator = { style = "icon", icons.ui.BoldLineLeft },
			buffer_close_icon = icons.ui.Close,
			modified_icon = icons.ui.Circle,
			close_icon = icons.ui.BoldClose,
			left_trunc_marker = icons.ui.ArrowCircleLeft,
			right_trunc_marker = icons.ui.ArrowCircleRight,
			max_name_length = 30,
			max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
			tab_size = 21,
			offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
			color_icons = true,
			show_buffer_icons = true,
			show_buffer_close_icons = true,
			show_close_icon = true,
			show_tab_indicators = true,
			show_duplicate_prefix = true,
			persist_buffer_sort = true,
			separator_style = "thin",
			enforce_regular_tabs = true,
			always_show_bufferline = true,
			diagnostics = "nvim_lsp",
			view = {
				adaptive_size = false,
			},
		},
		highlights = {
			fill = {
				-- fg = "#ffffff",
				-- bg = "#ffffff",
			},
		},
	})
end

return {
	"akinsho/bufferline.nvim",
	lazy = false,
	priority = 500,
	config = config,
}
