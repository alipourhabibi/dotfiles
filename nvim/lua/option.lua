vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.undofile = true

vim.opt.smartcase = true
vim.opt.ignorecase = true

vim.opt.updatetime = 400
vim.opt.timeoutlen = 400

vim.opt.spell = true
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.mouse = "a"
vim.opt.signcolumn = "yes"
vim.opt.inccommand = "split"
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.clipboard:append("unnamedplus")
vim.opt.formatoptions:remove("o")
vim.diagnostic.config({ virtual_text = { true } })
