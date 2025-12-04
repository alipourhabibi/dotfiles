vim.g.mapleader = " "

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")

vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")

vim.keymap.set("n", "<leader>s", [[:%s//g<left><left>]])
vim.keymap.set("v", "<leader>s", [[:s//g<left><left>]])

vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr>")

vim.keymap.set("n", "<c-right>", "<c-w>5>")
vim.keymap.set("n", "<c-left>", "<c-w>5<")
vim.keymap.set("n", "<c-up>", "<c-w>5+")
vim.keymap.set("n", "<c-down>", "<c-w>5-")

vim.keymap.set("n", "tn", "<cmd>tabnew<CR>")
vim.keymap.set("n", "tk", "<cmd>tabnext<CR>")
vim.keymap.set("n", "tj", "<cmd>tabprev<CR>")
vim.keymap.set("n", "th", "<cmd>tabfirst<CR>")
vim.keymap.set("n", "tl", "<cmd>tablast<CR>")

vim.keymap.set("n", "<leader>q", function()
    vim.fn.setqflist({ { filename = vim.fn.expand("%"), lnum = 1, col = 1, text = vim.fn.expand("%") } }, "a")
end)
