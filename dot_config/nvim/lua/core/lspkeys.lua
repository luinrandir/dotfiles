--LSP specific keymaps

local keymap = vim.keymap -- local variable for ease
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		--Buffer for local mappings
		--Check out `:help vim.lsp.*` for documentation
		local opts = { buffer = ev.buf, silent = true }

		--keybinds
		--Restart LSP
		opts.desc = "Restart LSP"
		keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

		--LSP reference
		opts.desc = "Show LSP references"
		keymap.set("n", "gR", function()
			Snacks.picker.lsp_references()
		end, opts)

		--LSP declaration
		opts.desc = "Go to declaration"
		keymap.set("n", "gD", function()
			Snacks.picker.lsp_declarations()
		end, opts)

		--LSP definition
		opts.desc = "Show LSP definition"
		keymap.set("n", "gd", function()
			Snacks.picker.lsp_definitions()
		end, opts)

		--LSP implementations
		opts.desc = "Show LSP implementations"
		keymap.set("n", "gi", function()
			Snacks.picker.lsp_implementations()
		end, opts)

		--LSP type definitions
		opts.desc = "Show LSP type definitions"
		keymap.set("n", "gt", function()
			Snacks.picker.lsp_type_definitions()
		end, opts)

		--LSP code actions
		opts.desc = "See available code actions"
		keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

		--LSP smart rename
		opts.desc = "Smart rename"
		keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

		--Diagnostic line
		opts.desc = "Show diagnostic line"
		vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

		--Navigate diagnostics
		opts.desc = "Goto previous diagnostic"
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.jump({ count = 1, float = true })
		end, opts)

		opts.desc = "Go to next diagnostic"
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.jump({ count = -1, float = true })
		end, opts)

		--Show documentation under cursor
		opts.desc = "Show documentation for what is under cursor"
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	end,
})

local severity = vim.diagnostic.severity

vim.diagnostic.config({
	signs = {
		text = {
			[severity.ERROR] = " ",
			[severity.WARN] = " ",
			[severity.HINT] = "󰠠 ",
			[severity.INFO] = " ",
		},
	},
})
