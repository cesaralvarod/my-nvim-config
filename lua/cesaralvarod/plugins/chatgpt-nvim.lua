local status_ok, chatgpt = pcall(require, "chatgpt-nvim")
if not status_ok then
	return
end

chatgpt.setup()
