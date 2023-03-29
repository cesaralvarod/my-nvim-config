local has_picker, picker = pcall(require, "icon-picker")
if not has_picker then
	return
end

picker.setup({
	disable_legacy_commands = true,
})
