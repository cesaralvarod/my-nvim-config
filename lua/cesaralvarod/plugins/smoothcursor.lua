local status_ok, cursor = pcall(require, "smoothcursor")
if not status_ok then
	return
end

cursor.setup()
