--Global Keymaps
--Set new global leader key and local leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

--Prevent deleting without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

--NORMAL mode keymaps
--Keeps the cursor in the middle while scrolling and as well in the middle when searching
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--No Q, we do not need to go into Ex mode
vim.keymap.set("n", "Q", "<nop>")

-- Regex Stuff
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

--Set current file as an executable with chmod
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc="Make current file executable" })

--Enter the command line easier
vim.keymap.set("n", "<leader><leader>", ":", {desc="Toggle the command line"})

--Move to a window using the arrow keys instead
vim.keymap.set("n", "<left>", "<C-w>h")
vim.keymap.set("n", "<down>", "<C-w>j")
vim.keymap.set("n", "<up>", "<C-w>k")
vim.keymap.set("n", "<right>", "<C-w>l")

--Restart neovim
vim.keymap.set("n", "<leader>re", "<cmd>restart<cr>", { desc = "Restart config :restart)" })

--Keep cursor in its location while joining lines
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines without moving cursor" })

vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "Clear search highlighting", silent = true })

--INSERT mode keymaps
--Make pressing the escape key easier
vim.keymap.set("i", "jj", "<ESC>", { silent = true })

--VISUAL mode keymaps
--Move highlighted lines set in VISUAL mode either up or down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {desc="Move highlighted line up in VISUAL mode"})
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc="Move highlighted line down in VISUAL mode"})

--Line indentation in VISUAL mode
vim.keymap.set("v", "<", "<gv", { desc = "Unindent and keep selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent and keep selection" })

--Paste without loosing yanked text
vim.keymap.set("x", "p", [["_dP]], { desc = "Paste over selection without losing yanked text" })

