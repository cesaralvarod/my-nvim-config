return {
	"numToStr/Comment.nvim",

	keys = {
		{ "gcc", desc = "Toggles the current line using linewise comment" },
		{ "gbc", desc = "Toggles the current line using blockwise comment" },
		{ "gc", mode = "v", desc = "Toggles the region using linewise comment" },
		{ "gb", mode = "v", desc = "Toggles the region using blockwise comment" },
		{ "gco", desc = "Insert comment to the next line and enters INSERT mode" },
		{ "gcO", desc = "Insert comment to the previous line and enters INSERT mode" },
		{ "gcA", desc = "Insert comment to end of the current line and enters INSERT mode" },
		{ "gcw", desc = "Toggle from the current cursor position to the next word" },
		{ "gc$", desc = "Toggle from the current cursor position to the end of line" },
		{ "gc}", desc = "Toggle from the current cursor position to the end of line" },
		{ "gca}", desc = "Toggle around curly brackets" },
		{ "gcip", desc = "Toggle inside of paragraph" },
		{ "gbaf", desc = "Toggle comment around a function (w/ LSP/TreeSitter support)" },
		{ "gbac", desc = "Toggle comment around a class (w/ LSP/TreeSitter support)" },
	},
	config = true,
}
