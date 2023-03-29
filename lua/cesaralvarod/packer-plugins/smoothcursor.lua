local has_cursor, cursor = pcall(require, "smoothcursor")
if not has_cursor then
	return
end

cursor.setup()
