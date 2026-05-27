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
							},
						},
					},
				},
				config = function()
					vim.diagnostic.config({
						virtual_lines = true,
						underline = true,
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
