--Neovim Options

--Set borders
vim.o.winborder = "rounded"

--Set number line on side, relative numbers for ease of travel,and prevent text wrapping.
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.wrap = false

--Set our tab spacing and ensure the tab button works correctly in INSERT mode.
--Set custom variable for easier adjustment.
local tab_length = 2
vim.opt.tabstop = tab_length
vim.opt.softtabstop = tab_length
vim.opt.shiftwidth = tab_length
vim.opt.expandtab = true

--Set interactive command and splits for commands
vim.opt.inccommand = "split"
vim.opt.splitbelow = true
vim.opt.splitright = true

--Highlighting while we search, case sensitivity for searching, and a global status line.
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.laststatus = 3

--Remove swapfile and backup since we will be using our own version control with git.
vim.opt.swapfile = false
vim.opt.backup = false

--Set our undo directory and file to set up persistent undo capabilities
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.undofile = true

--Make sure our colorschemes work well as intended.
vim.opt.termguicolors = true

--Make scrolling nice by ensuring that there is aminimal amount of lines above and below the cursor.
vim.opt.scrolloff = 8

--Make sure we can see diagnostic signs in the column.
vim.opt.signcolumn = "yes"

--Make sure that the @ character is recognized in a filename.
vim.opt.isfname:append("@-@")

--Set our update time to 50ms.
vim.opt.updatetime = 50

--Turn on spell check.
vim.opt.spell = true
vim.opt.spelllang = { "en_us" }

--Set Folds
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevelstart = 99

--Display highlighted text when yanking.
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	callback = function()
		vim.hl.on_yank()
	end,
})
