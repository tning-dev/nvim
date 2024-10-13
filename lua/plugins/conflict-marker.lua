local conflict_maker = {
	"rhysd/conflict-marker.vim",
	config = function ()
		vim.g.conflict_marker_enable_hooks = 1
		vim.g.conflict_marker_enable_mappings = 1
		vim.g.conflict_marker_enable_highlight = 1
	end,

	event = "VeryLazy"
}

return {conflict_maker}
