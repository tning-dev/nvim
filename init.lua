-- 关闭 marscode 内置自动补全
vim.g.marscode_disable_autocompletion = true
-- 关闭 marscode 内置 tab 映射
vim.g.marscode_no_map_tab = true
-- 关闭 marscode 内置补全映射
vim.g.marscode_disable_bindings = true
require("config.lazy")
require("keybinding")
require("basic")
