local status_ok, alternate = pcall(require, "alternate-toggler")
if not status_ok then
  return
end

alternate.setup({
  alternates = {
    ["=="] = "!=",
  },
  event = { "BufReadPost" },
})
