return {
    {
        "nvim-tree/nvim-web-devicons",
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            vim.g.tokyonight_transparent_sidebar = true
            vim.g.tokyonight_transparent = true
            vim.opt.background = "dark"

            require("tokyonight").setup({
                style = "night",
                styles = {
                    functions = {},
                },
            })

            vim.cmd("colorscheme tokyonight")
        end,
    },
}
