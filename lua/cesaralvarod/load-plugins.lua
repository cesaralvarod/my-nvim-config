local plugins_path = "cesaralvarod.plugins."
local lsp_path = "cesaralvarod.lsp."

require(plugins_path .. "nvim-tree")
require(plugins_path .. "lualine")
require(plugins_path .. "bufferline")
require(plugins_path .. "nvim-treesitter")
require(plugins_path .. "autopairs")
require(plugins_path .. "telescope")
require(plugins_path .. "comment")
require(plugins_path .. "notify")
require(plugins_path .. "gitsigns")
require(plugins_path .. "sniprun")
require(plugins_path .. "rainbow")
require(plugins_path .. "colorizer")
require(plugins_path .. "alpha")
require(plugins_path .. "alternate")
require(plugins_path .. "todo-comments")
require(plugins_path .. "fidget") -- LSP load
require(plugins_path .. "bookmarks")
require(plugins_path .. "indent")
require(plugins_path .. "harpoon")
require(plugins_path .. "hop")
require(plugins_path .. "spectre")

require(lsp_path .. "init")
