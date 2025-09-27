return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				opts = {
					library = {
						-- See the configuration section for more details
						-- Load luvit types when the `vim.uv` word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		config = function()
			vim.diagnostic.config({
				virtual_lines = true,
				underline = true,
			})
			-- Keymap variables & on_attach function
			local opts = { noremap = true, silent = true }

			-- Global Keymaps
			opts.desc = "Show diagnostic line"
			vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
			opts.desc = "Goto previous diagnostic"
			vim.keymap.set("n", "[d", function()
				vim.diagnostic.jump({ count = 1 })
			end, opts)
			opts.desc = "Go to next diagnostic"
			vim.keymap.set("n", "]d", function()
				vim.diagnostic.jump({ count = -1 })
			end, opts)
			-- Setting up keymaps for lsp functions
			opts.desc = "Lsp Definitions"
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			opts.desc = "Display documentation for what is under cursor"
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			opts.desc = "Display LSP code actions"
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
			opts.desc = "Smart rename"
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		end,
	},
}
