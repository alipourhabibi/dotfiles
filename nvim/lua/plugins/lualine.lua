return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				globalstatus = true,
				icons_enabled = false,
				component_separators = "|",
			},
			sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					"mode",
					{ "filename", path = 1 },
					"branch",
					"diff",
					"diagnostics",
				},
				lualine_x = { "progress" },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
