return {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    ft = "markdown",
    dependencies = { "nvim-lua/plenary.nvim" },
    init = function()
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "markdown",
            callback = function() vim.opt_local.conceallevel = 1 end,
        })
    end,
    opts = {
        legacy_commands = false,
        -- render-markdown.nvim draws the markdown
        ui = { enable = false },
        workspaces = {
            { name = "secondBrain", path = "~/obsidian/SecondBrain/SecondBrain" },
        },
    },
}
