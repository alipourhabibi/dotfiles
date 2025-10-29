return {
	"stevearc/conform.nvim",
	event = "VeryLazy",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "gofmt", "goimports" },
				c = { "clang-format" },
				python = { "isort", "black" },
				rust = { "rustfmt" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})
		vim.keymap.set("n", "<leader>=", function()
			require("conform").format({
				lsp_format = "fallback",
			})
		end)
	end,
}
