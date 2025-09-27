--Set number line on the side. Apply relative numbers for ease of travel. Prevent text wrapping.
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.wrap = false

--Set our tab spacing to 2 and then make sure that the tab button works correctly in insert mode.
--Custom variable for easier adjustment in the future.
tab_length = 2
vim.opt.tabstop = tab_length
vim.opt.softtabstop = tab_length
vim.opt.shiftwidth = tab_length
vim.opt.expandtab = true

--Add smart indenting for some QoL.
vim.opt.smartindent = true

--Remove swapfile and backup since we will be using our own version control with git.
vim.opt.swapfile = false
vim.opt.backup = false

--Set our undo directory and file to set up persistent undo capabilities.
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

--Instead of highlighting after we search, we are going to set it to highlight as we search.
vim.opt.hlsearch = false
vim.opt.incsearch = true

--Make sure our colorschemes work well and as intended.
vim.opt.termguicolors = true

--Make scrolling nice by ensuring that there is a minimal amount of lines above and below the cursor when scrolling. 
vim.opt.scrolloff = 8

--Make sure we can see diagnostic signs in the column.
vim.opt.signcolumn = "yes"

--Make sure that the @ character is recognized in a filename.
vim.opt.isfname:append("@-@")

--Set our update time to 50ms.
vim.opt.updatetime = 50

--Turn on spell check!
vim.opt.spell = true
vim.opt.spelllang = { "en_us" }
