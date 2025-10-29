return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<C-Down>"] = require("telescope.actions").cycle_history_next,
						["<C-Up>"] = require("telescope.actions").cycle_history_prev,
					},
				},
			},
			extensions = {
				fzf = {},
			},
		})
		require("telescope").load_extension("fzf")
		vim.keymap.set("n", "<leader>f", require("telescope.builtin").find_files)
		vim.keymap.set("n", "<leader>fw", require("telescope.builtin").grep_string)
		vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep)
		vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers)
		vim.keymap.set("n", "<leader>fd", require("telescope.builtin").diagnostics)
		vim.keymap.set("n", "<leader>fc", require("telescope.builtin").git_bcommits)
		vim.keymap.set("n", "<leader>fs", require("telescope.builtin").lsp_document_symbols)
		vim.keymap.set("n", "<leader>fr", require("telescope.builtin").lsp_references)
		vim.keymap.set("n", "<leader>fi", require("telescope.builtin").lsp_implementations)
		vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags)
		vim.keymap.set("n", "<leader>ft", require("telescope.builtin").treesitter)
		vim.keymap.set("n", "<leader>fp", require("telescope.builtin").resume)
		vim.keymap.set("n", "<leader>/", require("telescope.builtin").current_buffer_fuzzy_find)
	end,
}
