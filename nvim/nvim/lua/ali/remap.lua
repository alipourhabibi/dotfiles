local nnoremap = require("ali.keymap").nnoremap

nnoremap("<C-p>", "<cmd>NERDTree<CR>")

nnoremap("tn", "<cmd>tabnew<CR>")
nnoremap("tk", "<cmd>tabnext<CR>")
nnoremap("tj", "<cmd>tabprev<CR>")
nnoremap("th", "<cmd>tabfirst<CR>")
nnoremap("tl", "<cmd>tablast<CR>")

nnoremap("<C-h>", "<cmd>lua vim.lsp.buf.definition()<CR>")
nnoremap("<C-i>", "<cmd>lua vim.lsp.buf.references()<CR>")

nnoremap("<leader>ff", "<cmd>Telescope find_files<CR>")
nnoremap("<leader>F", "<cmd>Telescope live_grep<CR>")

nnoremap("<leader>y", '"+y')
nnoremap("<leader>p", '"+p')
