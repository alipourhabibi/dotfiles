return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"c",
				"bash",
				"go",
				"lua",
				"markdown",
				"vimdoc",
			},
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = true,
				disable = { "latex" },
			},
			indent = {
				enable = true,
			},
		})
	end,
}
