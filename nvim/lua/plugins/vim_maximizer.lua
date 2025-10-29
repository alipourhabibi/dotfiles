return {
	"szw/vim-maximizer",
	event = "VeryLazy",
	config = function()
		vim.keymap.set("n", "<leader>z", "<cmd>MaximizerToggle!<cr>")
	end,
}
