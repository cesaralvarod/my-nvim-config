local barbecue_status_ok, barbecue = pcall(require, "barbecue")
if not barbecue_status_ok then
	return
end

local icons = require("cesaralvarod.icons")

barbecue.setup({
	show_dirname = false,
	-- show_basename = false,
	kinds = icons.kind,
})
