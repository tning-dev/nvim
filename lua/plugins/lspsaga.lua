--[[
- @file lspsaga.lua
- @brief
- @author tenfyzhong
- @email tenfy@tenfy.cn
- @created 2023-02-07 20:50:17
--]]

local lspsaga = {
    'nvimdev/lspsaga.nvim',
    branch = "main",
    config = function()
        require("lspsaga").setup({
            lightbulb = {
                enable = true,
                sign = false,
                virtual_text = true,
            },
            definition = {
                keys = {
                    edit = { 'o', '<cr>' },
                    vsplit = 'v',
                    split = 's',
                    tabe = 't',
                    -- quit = { 'q', '<ESC>' },
                    close = { 'q', '<ESC>' },
                },
            },
            callhierarchy = {
                keys = {
                    edit = { 'o', '<cr>' },
                    vsplit = 'v',
                    split = 's',
                    tabe = 't',
                    -- quit = { 'q', '<ESC>' },
                    close = { 'q', '<ESC>' },
                    shuttle = { '<c-l>', '<c-h>' },
                    toggle_or_req = 'u',
                },
            },
            diagnostic = {
                keys = {
                    quit = { 'q', '<ESC>' },
                },
            },
            finder = {
                keys = {
                    shuttle = { '<c-l>', '<c-h>' },
                    toggle_or_open = { 'o', '<cr>' },
                    vsplit = 'v',
                    split = 's',
                    tabe = 't',
                    tabnew = 'r',
                    -- quit = { 'q', '<ESC>' },
                    close = { 'q', '<ESC>' },
                },
            },
            outline = {
                keys = {
                    toggle_or_jump = { 'o', '<cr>' },
                    quit = { 'q', '<ESC>' },
                    jump = 'e',
                },
            },
            code_action = {
                keys = {
                    quit = { 'q', '<ESC>' },
                    exec = '<cr>',
                },
            },
        })
    end,
    event = 'LspAttach',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {

        -- you can use <C-t> to jump back
        { "gh",         "<cmd>silent Lspsaga finder<CR>",                  mode = "n",          silent = true, remap = false },

        -- Code action
        { "<leader>la", "<cmd>silent Lspsaga code_action<CR>",             mode = { "n", "v" }, silent = true, remap = false },

        -- Rename all occurrences of the hovered word for the entire file
        { "<leader>re", "<cmd>silent Lspsaga rename<CR>",                  mode = "n",          silent = true, remap = false },

        -- Peek definition
        -- You can edit the file containing the definition in the floating window
        -- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
        -- It also supports tagstack
        -- Use <C-t> to jump back
        { "gD",         "<cmd>silent Lspsaga peek_definition<CR>",         mode = "n",          silent = true, remap = false },

        -- Go to definition
        { "gd",         "<cmd>silent Lspsaga goto_definition<CR>",         mode = "n",          silent = true, remap = false },

        -- Show line diagnostics
        -- You can pass argument ++unfocus to
        -- unfocus the show_line_diagnostics floating window
        { "<leader>ll", "<cmd>silent Lspsaga show_line_diagnostics<CR>",   mode = "n",          silent = true, remap = false },

        -- Show cursor diagnostics
        -- Like show_line_diagnostics, it supports passing the ++unfocus argument
        { "<leader>lc", "<cmd>silent Lspsaga show_cursor_diagnostics<CR>", mode = "n",          silent = true, remap = false },

        -- Show buffer diagnostics
        { "<leader>lb", "<cmd>silent Lspsaga show_buf_diagnostics<CR>",    mode = "n",          silent = true, remap = false },

        -- Diagnostic jump
        -- You can use <C-o> to jump back to your previous location
        { "[e",         "<cmd>silent Lspsaga diagnostic_jump_prev<CR>",    mode = "n",          silent = true, remap = false },
        { "]e",         "<cmd>silent Lspsaga diagnostic_jump_next<CR>",    mode = "n",          silent = true, remap = false },

        -- Diagnostic jump with filters such as only jumping to an error
        {
            "[E",
            function()
                require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
            end,
            mode = "n",
            silent = true,
            remap = false
        },
        {
            "]E",
            function()
                require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
            end,
            mode = "n",
            silent = true,
            remap = false
        },

        -- Toggle outline
        { "<leader>lt", "<cmd>silent Lspsaga outline<CR>",        mode = "n",          silent = true, remap = false },

        -- Hover Doc
        -- If there is no hover doc,
        -- there will be a notification stating that
        -- there is no information available.
        -- To disable it just use ":Lspsaga hover_doc ++quiet"
        -- Pressing the key twice will enter the hover window
        -- keymap("n", "K", "<cmd>silent Lspsaga hover_doc<CR>", { silent = true, remap = false })

        -- If you want to keep the hover window in the top right hand corner,
        -- you can pass the ++keep argument
        -- Note that if you use hover with ++keep, pressing this key again will
        -- close the hover window. If you want to jump to the hover window
        -- you should use the wincmd command "<C-w>w"
        { "K",          "<cmd>silent Lspsaga hover_doc<CR>",      mode = "n",          silent = true, remap = false },

        -- Call hierarchy
        { "<Leader>li", "<cmd>silent Lspsaga incoming_calls<CR>", mode = "n",          silent = true, remap = false },
        { "<Leader>lo", "<cmd>silent Lspsaga outgoing_calls<CR>", mode = "n",          silent = true, remap = false },

        -- Floating terminal
        { "<A-d>",      "<cmd>silent Lspsaga term_toggle<CR>",    mode = { "n", "t" }, silent = true, remap = false },
    },
}

return { lspsaga }
