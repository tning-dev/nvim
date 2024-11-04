-- 关闭 codeverse 内置自动补全
vim.g.codeverse_disable_autocompletion = true
-- 关闭 codeverse 内置 tab 映射
vim.g.codeverse_no_map_tab = true
-- 关闭 codeverse 内置补全映射
vim.g.codeverse_disable_bindings = true
require("config.lazy")
require("keybinding")
