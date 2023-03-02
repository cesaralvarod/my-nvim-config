local status_ok, picker = pcall(require, "color-picker")
if not status_ok then
	return
end

picker.setup()
