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

                javascript = { "prettier" },
                javascriptreact = { "prettier" },
                typescript = { "prettier" },
                typescriptreact = { "prettier" },
            },
            format_on_save = {
                timeout_ms = 5000,
                lsp_format = "fallback",
            },
        })

        vim.keymap.set("n", "<leader>=", function()
            require("conform").format({
                lsp_format = "fallback",
            })
        end)

        vim.api.nvim_create_autocmd("FileType", {
            pattern = {
                "javascript",
                "javascriptreact",
                "typescript",
                "typescriptreact",
            },
            callback = function()
                vim.bo.shiftwidth = 2
                vim.bo.tabstop = 2
                vim.bo.softtabstop = 2
                vim.bo.expandtab = true
            end,
        })
    end,
}
