local config = function()
  local operations = require("lsp-file-operations")

  operations.setup()
end

return {
  "antosha417/nvim-lsp-file-operations",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-tree.lua",
  },
  config = config,
}
