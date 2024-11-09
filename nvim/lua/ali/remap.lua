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
nnoremap('<space>e', '<cmd>lua vim.diagnostic.open_float(0, {scope="line"})<CR>')

-- Function to set key mappings for a given mode
local function map(mode, key, result, opts)
  opts = opts or {}
  vim.api.nvim_set_keymap(mode, key, result, opts)
end

-- Define key mappings for dap
map('n', '<leader>db', '<cmd>DapToggleBreakpoint<CR>', { noremap = true, silent = true, desc = 'Add breakpoint at line' })
map('n', '<leader>dus', [[:lua require('dap.ui.widgets').sidebar(require('dap.ui.widgets').scopes).open()<CR>]], { noremap = true, silent = true, desc = 'Open debugging sidebar' })

-- Define key mappings for dap-go
map('n', '<leader>dgt', [[:lua require('dap-go').debug_test()<CR>]], { noremap = true, silent = true, desc = 'Debug go test' })
map('n', '<leader>dgl', [[:lua require('dap-go').debug_last()<CR>]], { noremap = true, silent = true, desc = 'Debug last go test' })

-- Define key mappings for gopher
map('n', '<leader>gsj', '<cmd>GoTagAdd json<CR>', { noremap = true, silent = true, desc = 'Add json struct tags' })
map('n', '<leader>gsy', '<cmd>GoTagAdd yaml<CR>', { noremap = true, silent = true, desc = 'Add yaml struct tags' })

-- Key mappings for easier use of DAP (optional but recommended)
vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
vim.api.nvim_set_keymap('n', '<F5>', ':lua require"dap".continue()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F6>', ':lua require"dap".step_into()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F7>', ':lua require"dap".step_over()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F8>', ':lua require"dap".step_out()<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>du', "<Cmd>lua require'dapui'.toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>de', "<Cmd>lua require'dapui'.eval()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>de', "<Cmd>lua require'dapui'.eval()<CR>", { noremap = true, silent = true })  -- Evaluate in visual mode
vim.api.nvim_set_keymap('n', '<leader>df', "<Cmd>lua require'dapui'.float_element()<CR>", { noremap = true, silent = true })
