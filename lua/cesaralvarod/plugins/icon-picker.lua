local status_ok, picker = pcall(require, "icon-picker")
if not status_ok then
	return
end

picker.setup({
	disable_legacy_commands = true,
})
