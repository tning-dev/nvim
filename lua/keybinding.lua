local opt = {
	silent = true,
	remap = false
}

-- move
vim.keymap.set('v', 'K', ":move '<-2<CR>gv-gv", opt)
vim.keymap.set('v','J', ":move '>+1<CR>gv-gv", opt)
vim.keymap.set('v', '>', '>gv', opt)
vim.keymap.set('v', '<', '<gv', opt)

-- bufferline
vim.keymap.set('n', '<s-h>', '<cmd>BufferLineCyclePrev<cr>', opt)
vim.keymap.set('n', '<s-l>', '<cmd>BufferLineCycleNext<cr>', opt)

--blame toggle
vim.keymap.set('n', '<leader>bt', '<cmd>BlameToggle<cr>', opt)

-- marscode
-- vim.g.marscode_disable_bindings = true
-- vim.keymap.set('i', '<C-z>', function () return vim.fn['marscode#Accept']() end, opt)

