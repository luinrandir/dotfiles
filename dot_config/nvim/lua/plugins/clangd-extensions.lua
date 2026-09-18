return {
	"dchinmay2/clangd_extensions.nvim",
	ft = { "c", "cpp", "objc", "objcpp", "cuda" },
	config = function()
		require("clangd_extensions").setup({
			-- optional config settings here
		})
	end,
}
