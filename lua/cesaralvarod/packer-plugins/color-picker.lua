local has_picker, picker = pcall(require, "color-picker")
if not has_picker then
	return
end

picker.setup()
