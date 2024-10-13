local blamer = {
	"APZelos/blamer.nvim",
	config = function ()
		vim.g.blamer_enabled = 1
		vim.g.blamer_delay = 1000
		vim.g.blamer_show_in_visual_modes = 1
		vim.g.blamer_show_in_insert_modes = 1
		vim.g.blamer_template = '<committer> <committer-time>'
	end
}

return {blamer}
