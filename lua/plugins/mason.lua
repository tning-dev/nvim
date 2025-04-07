local mason_lspconfig = {
    'williamboman/mason-lspconfig.nvim',
}

local lsp = {
    'neovim/nvim-lspconfig',
}

local cmp_nvim_lsp = {
    'hrsh7th/cmp-nvim-lsp',
}

local mason = {
    "williamboman/mason.nvim",
    build = function()
        vim.cmd('MasonUpdate')
        local pkg = {
			'java-test',
			'java-debug-adapter',
            'bash-language-server',
            'gofumpt',
            'goimports',
            'golines',
            'gotests',
            'iferr',
            'impl',
            'json-lsp',
            'json-to-struct',
            'lua-language-server',
            'java-language-server',
            'luacheck',
            'luaformatter',
            'python-lsp-server',
            'sqlfmt',
            'sqlls',
            'thriftls',
            'vim-language-server',
            'yaml-language-server' }
        local str = table.concat(pkg, ' ')
        vim.cmd('MasonInstall ' .. str)
    end,
    config = function()
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
            max_concurrent_installers = 8,
        })

        local lspconfig = require("lspconfig")
        require("mason-lspconfig").setup({
            automatic_installation = true,
        })
        require("mason-lspconfig").setup_handlers {
            -- The first entry (without a key) will be the default handler
            -- and will be called for each installed server that doesn't have
            -- a dedicated handler.
            function(server_name) -- default handler (optional)
                lspconfig[server_name].setup {}
            end,
            -- Next, you can provide a dedicated handler for specific servers.
            ["lua_ls"] = function()
                lspconfig.lua_ls.setup {
                    settings = {
                        Lua = {
                            runtime = {
                                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                                version = 'LuaJIT',
                            },
                            diagnostics = {
                                -- Get the language server to recognize the `vim` global
                                globals = { 'vim' },
                            },
                            workspace = {
                                -- Make the server aware of Neovim runtime files
                                library = vim.api.nvim_get_runtime_file("", true),
                                checkThirdParty = false,
                            },
                            -- Do not send telemetry data containing a randomized but unique identifier
                            telemetry = {
                                enable = false,
                            },
                            completion = {
                                callSnippet = "Replace"
                            },
                        },
                    },
                }
            end,
            ["pylsp"] = function()
                lspconfig.pylsp.setup {
                    settings = {
                        pylsp = {
                            plugins = {
                                pycodestyle = {
                                    ignore = { 'W391' },
                                    maxLineLength = 100
                                }
                            }
                        }
                    }
                }
            end,
            ['gopls'] = function()
                -- Set up lspconfig.
                local capabilities = require('cmp_nvim_lsp').default_capabilities()
                -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
                local on_attach = function(client, bufnr)
                    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

                    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

                    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
                end

                lspconfig.gopls.setup {
                    capabilities = capabilities,
                    cmd = { 'gopls' },
                    settings = {
                        -- https://github.com/golang/tools/blob/master/gopls/doc/settings.md
                        gopls = {
                            analyses = {
                                useany = true,
                                unusedvariable = true,
                                fieldalignment = false,
                            },
                            experimentalPostfixCompletions = true,
                            gofumpt = true,
                            staticcheck = false,
                            usePlaceholders = true,
                        },
                    },

                    on_attach = on_attach,
                }
            end,
        }
    end,
    dependencies = {
        mason_lspconfig,
        lsp,
        cmp_nvim_lsp,
    },
}

return { mason }
