local has_dressing, dressing = pcall(require, "dressing")
if not has_dressing then
	return
end

dressing.setup()