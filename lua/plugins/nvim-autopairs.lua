--[[
- @file nvim-autopairs.lua
- @brief
- @author tenfyzhong
- @email tenfy@tenfy.cn
- @created 2023-01-27 18:42:42
--]]

local autopairs = {
    'windwp/nvim-autopairs',
    config = function() require("nvim-autopairs").setup {} end,
    event = 'VeryLazy',
}

return { autopairs }
