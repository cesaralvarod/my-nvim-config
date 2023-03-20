local has_hop, hop = pcall(require, "hop")
if not has_hop then
	return
end

hop.setup({})
