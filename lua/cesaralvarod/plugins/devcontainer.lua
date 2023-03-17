local has_devcontainer, devcontainer = pcall(require, "devcontainer")
if not has_devcontainer then
	return
end

devcontainer.setup({})
