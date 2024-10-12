
local nvim_tree = {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    vim.opt.termguicolors = true
    require("nvim-tree").setup {}
  end
}

return {nvim_tree}
