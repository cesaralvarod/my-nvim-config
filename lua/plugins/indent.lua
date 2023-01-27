local status_ok, indent = pcall(require, "indent_blankline")
if not status_ok then
	return
end

local opt = vim.opt

opt.list = true

indent.setup({
	show_current_context = true,
	show_end_of_line = true,
})
