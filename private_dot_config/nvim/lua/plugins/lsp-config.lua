return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
		},
		config = function()
			-- Local variables for simplicity
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local mason = require("mason")
			local mason_lsp = require("mason-lspconfig")

			-- Keymap variables & on_attach function
			local opts = { noremap = true, silent = true }

			-- Global Keymaps
			opts.desc = "Show diagnostic line"
			vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
			opts.desc = "Goto previous diagnostic"
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
			opts.desc = "Go to next diagnostic"
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

			-- on_attach keymaps
			local on_attach = function(client, bufnr)
				opts.buffer = bufnr

				-- Setting up keymaps for lsp functions
				opts.desc = "Lsp Definitions"
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				opts.desc = "Display documentation for what is under cursor"
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				opts.desc = "Display LSP code actions"
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
				opts.desc = "Smart rename"
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			end

			-- Set up Mason with some UI changes for the icons
			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			-- Set up Mason lsp configs -> Ensure lua lsp install and auto set up capabilities for
			-- installed lsp servers
			mason_lsp.setup({
				ensure_installed = { "lua_ls" },
			})
			mason_lsp.setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
						on_attach = on_attach,
					})
				end,
				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
								workspace = {
									library = {
										[vim.fn.expand("$VIMRUNTIME/lua")] = true,
										[vim.fn.stdpath("config") .. "/lua"] = true,
									},
								},
							},
						},
					})
				end,
			})
		end,
	},
}
