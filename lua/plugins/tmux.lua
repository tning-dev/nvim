local tmux = {
    'aserowy/tmux.nvim',
    config = function()
        require('tmux').setup {}
    end,
    keys = {
        { '<c-h>', function() require('tmux').move_left() end,   mode = 'n', remap = false, silent = true, desc = 'tmux: goto left window' },
        { '<c-j>', function() require('tmux').move_bottom() end, mode = 'n', remap = false, silent = true, desc = 'tmux: goto below window' },
        { '<c-k>', function() require('tmux').move_top() end,    mode = 'n', remap = false, silent = true, desc = 'tmux: goto above window' },
        { '<c-l>', function() require('tmux').move_right() end,  mode = 'n', remap = false, silent = true, desc = 'tmux: goto right window' },
    }
}

return { tmux }
