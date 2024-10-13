--[[
- @file vim-grepper.lua
- @brief
- @author tenfyzhong
- @email tenfy@tenfy.cn
- @created 2023-01-27 23:03:42
--]]

local grepper = {
    'mhinz/vim-grepper',
    config = function()
        vim.g.grepper = {
            highlight = 1,
            tools = { 'rg', 'ag' },
            dir = 'repo,cwd',
        }

        vim.api.nvim_create_user_command('Todo',
            "Grepper -noprompt -tool rg -grepprg rg --vimgrep '(// todo\\b|// bug\\b|// error\\b)'",
            { desc = 'grepper: Find todo bug error' })
    end,
    cmd = { 'Grepper', 'Todo' },
    keys = {
        { 'gr',        '<plug>(GrepperOperator)',                mode = { 'n', 'x' }, remap = true, desc = 'grepper: grep' },
        { '<leader>*', ':Grepper -tool rg -cword -noprompt<cr>', mode = 'n',        remap = false, desc = 'grepper: grep cword' },
    },
}

return { grepper }
