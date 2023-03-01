local navic_loaded, navic = pcall(require, "nvim-navic")

if not navic_loaded then
  print("nvim-navic not loaded")
  return
end

navic.setup()
