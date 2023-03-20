local has_notify, notify = pcall(require, "notify")
if not has_notify then
	return
end

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
