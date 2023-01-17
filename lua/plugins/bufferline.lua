local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

local icons = require("icons")

bufferline.setup({
	options = {
		mode = "buffers",
		numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,

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
		persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
		-- can also be a table containing 2 custom separators
		-- [focused and unfocused]. eg: { '|', '|' }
		separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
		enforce_regular_tabs = true,
		always_show_bufferline = true,

		diagnostics = "nvim_lsp",
		view = {
			adaptive_size = false,
		},
	},
})
