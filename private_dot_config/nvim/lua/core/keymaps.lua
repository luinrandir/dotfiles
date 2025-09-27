--Set new global leader key and local leader key.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

--Move highlighted lines set in visual mode either up or down.
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--Keeps the cursor in the middle while scrolling and as well in the middle when searching.
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--No Q, we do not need to go into Ex mode.
vim.keymap.set("n", "Q", "<nop>")

-- Regex Stuff
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

--Set current file as an executable with chmod.
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc="Make current file executable" })

--Make pressing the escape key easier.
vim.keymap.set("i", "jj", "<ESC>", { silent = true })

--Make pressing the : key easier.
vim.keymap.set("n", "<leader><leader>", ":")

--Move to a window using the arrow keys instead.
vim.keymap.set("n", "<left>", "<C-w>h")
vim.keymap.set("n", "<down>", "<C-w>j")
vim.keymap.set("n", "<up>", "<C-w>k")
vim.keymap.set("n", "<right>", "<C-w>l")
