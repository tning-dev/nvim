local opt = {
	silent = true,
	remap = false
}

-- move
vim.keymap.set('v', 'K', ":move '<-2<CR>gv-gv", { silent = true, remap = false })
vim.keymap.set('v','J', ":move '>+1<CR>gv-gv", { silent = true, remap = false })
vim.keymap.set('v', '>', '>gv', { silent = true, remap = false })
vim.keymap.set('v', '<', '<gv', { silent = true, remap = false })

-- bufferline
vim.keymap.set('n', '<s-h>', '<cmd>BufferLineCyclePrev<cr>', opt)
vim.keymap.set('n', '<s-l>', '<cmd>BufferLineCycleNext<cr>', opt)
