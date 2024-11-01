local fzf = {
	"junegunn/fzf",
	build = ":call fzf#install()",
	lazy=true
}

local function find_tag()
	if vim.bo.filetype == 'neo-tree' or vim.bo.filetype == 'aerial' then
		vim.cmd('silent FZFBLines')
	else
		vim.cmd('call aerial#fzf()')
	end
end

local fzf_vim = {
    'junegunn/fzf.vim',
    -- event = 'VeryLazy',
    dependencies = { 'stevearc/aerial.nvim', fzf[1] },
    init = function()
        vim.g.fzf_command_prefix = 'FZF'
        vim.g.fzf_history_dir = '~/.fzf-history'
    end,
    config = function() end,
    cmd = { 'FZF', 'FZFFiles', 'FZFGFiles', 'FZFBuffers', 'FZFRg', 'FZFAg' },
    keys = {
        { '<leader>ff', ':FZFFiles<cr>',   silent = true, remap = false, desc = 'fzf: files' },
        { '<leader>fg', ':FZFGFiles<cr>',  silent = true, remap = false, desc = 'fzf: git files' },
        { '<leader>fb', ':FZFBuffers<cr>', silent = true, remap = false, desc = 'fzf: buffers' },
        { '<leader>fr', ':FZFRg<cr>',      silent = true, remap = false, desc = 'fzf: rg' },
        { '<leader>fa', ':FZFAg<cr>',      silent = true, remap = false, desc = 'fzf: ag' },
        { '<leader>fh',       ':FZFHistory<cr>',    silent = true, remap = false,  desc = 'fzf: command history' },
        { '<leader>fw',       ':FZFWindows<cr>',    silent = true, remap = false,  desc = 'fzf: windows' },
        { '<leader>fc',       ':FZFCommands<cr>',   silent = true, remap = false,  desc = 'fzf: commands' },
        { '<leader>/',        ':FZFHistory/<cr>',   silent = true, remap = false,  desc = 'fzf: search history' },
        { '<leader>fT',       ':FZFTags<cr>',       silent = true, remap = false,  desc = 'fzf: ctags' },
        { '<leader>fm',       ':FZFMarks<cr>',      silent = true, remap = false,  desc = 'fzf: marks' },
        { '<leader>ft',       find_tag, 	    silent = true, remap = false,  desc = 'fzf: aerial' },
    },
}

return {fzf, fzf_vim}
