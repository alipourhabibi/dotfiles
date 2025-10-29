return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    config = function()
        vim.g.loaded_netrwPlugin = 1
        vim.g.loaded_netrw = 1
        require("neo-tree").setup({
            vim.keymap.set("n", "<c-p>", "<cmd>Neotree reveal toggle<cr>"),
            close_if_last_window = true,
            default_component_configs = {
                git_status = {
                    symbols = { false },
                },
                icon = {
                    folder_closed = "",
                    folder_open = "",
                    folder_empty = "",
                },
                symlink_target = {
                    enabled = true,
                },
            },
            filesystem = {
                hijack_netrw_behavior = "open_current",
                show_symlinks = true,
                follow_current_file = {
                    enabled = true,
                },
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    hide_hidden = false,
                },
            },
        })
    end,
}
