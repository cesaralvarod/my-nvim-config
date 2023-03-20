local has_barbecue, barbecue = pcall(require, "barbecue")
if not has_barbecue then
	return
end

local icons = require("cesaralvarod.icons")

barbecue.setup({
	show_dirname = false,
	-- show_basename = false,
	kinds = icons.kind,
})
