-- tabstop 4 space
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.bo.shiftwidth = 4
vim.o.shiftwidth = 4

-- 使用相对行号
vim.wo.number = true
vim.wo.relativenumber = true

-- 高亮所在行
vim.wo.cursorline = true

-- 新行对其当前行
vim.o.autoindent = true
vim.bo.autoindent = true
vim.bo.smartindent = true

-- 当文件被外部修改自动加载
vim.o.autoread = true
vim.bo.autoread = true

