local lsp_format = {
		"lukas-reineke/lsp-format.nvim",
		config= function ()
			require("lsp-format").setup{}
			require("lspconfig").gopls.setup { on_attach = require("lsp-format").on_attach }
			vim.cmd [[cabbrev wq execute "Format sync" <bar> wq]]
		end
}

return {lsp_format}
