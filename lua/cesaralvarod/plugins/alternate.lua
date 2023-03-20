local has_alternate, alternate = pcall(require, "alternate-toggler")
if not has_alternate then
	return
end

alternate.setup({
	alternates = {
		["=="] = "!=",
		["==="] = "!==",
	},
	event = { "BufReadPost" },
})
