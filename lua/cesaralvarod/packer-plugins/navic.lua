local has_navic, navic = pcall(require, "nvim-navic")

if not has_navic then
	print("nvim-navic not loaded")
	return
end

navic.setup()
