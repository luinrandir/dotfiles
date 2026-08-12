return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			-- list of servers for mason to install
			ensure_installed = {
				"lua_ls",
				"gopls",
			},
		},
		dependencies = {
			{
				"williamboman/mason.nvim",
				opts = {
					ui = {
						icons = {
							package_installed = "✓",
							package_pending = "➜",
							package_uninstalled = "✗",
						},
						border = "rounded",
					},
				},
			},
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
								{ path = "snacks.nvim", words = { "Snacks" } },
								{ path = "lazy.nvim", words = { "LazyVim" } },
							},
						},
					},
				},
				config = function()
					vim.filetype.add({
						extension = {
							cpp = "cpp.doxygen",
							c = "c.doxygen",
							cppm = "cpp",
							gotmpl = "gotmpl",
							mdx = "markdown.mdx",
						},
					})
					vim.lsp.config("clangd", {
						cmd = {
							"clangd",
							"--background-index",
							"--clang-tidy",
							"--header-insertion=iwyu",
							"--completion-style=detailed",
							"--function-arg-placeholders",
							"--fallback-style=llvm",
						},
						init_options = {
							usePlaceholders = true,
							completeUnimported = true,
							clangdFileStatus = true,
						},
					})
					vim.lsp.config("lua_ls", {
						settings = {
							Lua = {
								runtime = {
									pathStrict = false,
								},
							},
						},
					})
					vim.diagnostic.config({
						virtual_lines = true,
						underline = true,
						float = {
							border = "rounded",
						},
					})
				end,
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				--Catch-all formatter
				"prettier", -- prettier formatter

				--JavaScript/TypeScript linter
				"eslint_d",

				--Go formatter & linter
				"gofumpt",
				"goimports-reviser",
				"golines",
				"golangci-lint",

				--CSS/SCSS linter
				"stylelint",

				--Lua formatter
				"stylua",

				--Python formatter & linter
				"isort",
				"black",
				"pylint",
				"ruff",
				"mypy",

				--Bash linter
				"shellcheck",
			},
		},
		dependencies = {
			"williamboman/mason.nvim",
		},
	},
}
