local has_numb, numb = pcall(require, "numb")
if not has_numb then
	return
end

numb.setup()
