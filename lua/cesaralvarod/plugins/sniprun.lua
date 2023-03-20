local has_sniprun, sniprun = pcall(require, "sniprun")
if not has_sniprun then
	return
end

sniprun.setup({
	display = { "NvimNotify" },
})
