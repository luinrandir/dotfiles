return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
                    show_hidden_count = true,
                    hide_dotfiles = false,
					hide_by_name = {
						".git",
						".DS_Store",
						"thumbs.db",
					},
				},
			},
		})

		vim.keymap.set("n", "<leader>pv", "<Cmd>Neotree toggle<CR>")
	end,
}
