local neo_tree = {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function ()
	    require('neo-tree').setup {
		use_default_mappings = true,
            	close_if_last_window = true,
		event_handlers = {
                {
                    event = "neo_tree_buffer_enter",
                    handler = function(arg)
                        vim.opt.relativenumber = true
                    end,
                },
		filesystem = {
		    window = {
        		mappings = {
                    	-- disable fuzzy finder
          		 ["/"] = "noop",
			 ["S"] = "noop",
			 ["<c-b>"] = "noop",
			 ["<c-f>"] = "noop",
			 ["s"] = { command = 'open_split' },
			 ["v"] = { command = 'open_vsplit' },
         		}
       		    }
		}
            },
	 }
    end,
    keys = {
        { '<leader>nt', function() require('neo-tree.command').execute({ toggle = true, }) end, mode = { 'n' }, remap = false, desc = 'Neotree toggle=true' },
    },
}

return {neo_tree}
