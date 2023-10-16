local config = function()
	local mark = require("harpoon.mark")
	local ui = require("harpoon.ui")

	vim.keymap.set("n", "<A-m>", mark.add_file)
	vim.keymap.set("n", "<C-m>", ui.toggle_quick_menu)
end

return {
	"theprimeagen/harpoon",

	keys = {
		"<A-m>",
		"<C-m>",
	},
	config = config,
}
