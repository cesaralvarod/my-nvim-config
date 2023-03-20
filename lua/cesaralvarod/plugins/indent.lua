local has_indent, indent = pcall(require, "indent_blankline")
if not has_indent then
	return
end

indent.setup()
