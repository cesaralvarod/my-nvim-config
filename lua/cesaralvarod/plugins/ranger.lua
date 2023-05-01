local config = function()
  require("ranger-nvim").setup()

  vim.api.nvim_set_keymap("n", "<leader>ef", "", {
    noremap = true,
    callback = function()
      require("ranger-nvim").open(true)
    end,
  })
end

return {
  "kelly-lin/ranger.nvim",
  keys = { { "<leader>ef", "<cmd> require('ranger-nvim').open(true)<CR>" } },
  config = config,
}
