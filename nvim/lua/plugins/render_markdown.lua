return {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = "markdown",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    keys = {
        { "<leader>mr", "<cmd>RenderMarkdown toggle<cr>", desc = "Toggle markdown rendering" },
    },
    opts = {
        checkbox = {
            custom = {
                -- carried to a later daily note
                forwarded = { raw = "[>]", rendered = "\u{f061} ", highlight = "RenderMarkdownHint" },
            },
        },
    },
}
