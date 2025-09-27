return {
	"nvim-treesitter/nvim-treesitter",
  branch = 'master',
  lazy = false,
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = { "javascript", "typescript", "html", "css", "scss", "bash", "toml", "lua" },
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		})
	end,
}
