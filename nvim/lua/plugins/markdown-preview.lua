return {
    "iamcco/markdown-preview.nvim",

    cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
    ft = { "markdown" },

    build = function(plugin)
        if vim.fn.executable("npx") == 1 then
            vim.cmd("!cd " .. plugin.dir .. " && cd app && npx --yes yarn install")
        else
            vim.cmd("Lazy load markdown-preview.nvim")
            vim.fn["mkdp#util#install"]()
        end
    end,

    init = function()
        vim.g.mkdp_filetypes = { "markdown" }
    end,

    keys = {
        {
            "<leader>mp",
            "<cmd>MarkdownPreviewToggle<cr>",
            ft = "markdown",
            desc = "Markdown Preview (toggle)",
        },
    },

    config = function()
        vim.g.mkdp_auto_start = 0
        -- Close the preview tab automatically when you switch away/close the buffer.
        vim.g.mkdp_auto_close = 1
        -- Refresh on save and on leaving insert mode (set to 1 to refresh on every change).
        vim.g.mkdp_refresh_slow = 0
        -- Allow the preview to work for all files, not just markdown filetype.
        vim.g.mkdp_command_for_global = 0
        -- Only serve preview on localhost (set 1 to expose on your LAN).
        vim.g.mkdp_open_to_the_world = 0
        -- Echo the preview URL in the command line instead of opening a browser
        -- (handy on headless/remote machines). Leave empty to auto-open.
        vim.g.mkdp_open_ip = ""
        -- Let the plugin open your default browser. To force one:
        -- vim.g.mkdp_browser = "firefox"
        vim.g.mkdp_browser = "/home/ali/.config/nvim/md-previwe"
        -- Echo the preview URL when the server starts.
        vim.g.mkdp_echo_preview_url = 0
        -- Theme: "dark", "light", or remove to follow the system preference.
        vim.g.mkdp_theme = "dark"
        -- Keep the page scroll in sync with the cursor; "middle" keeps it centered.
        -- Options: "middle", "top", "relative".
        vim.g.mkdp_preview_options = {
            mkit = {},  -- markdown-it options
            katex = {}, -- math rendering
            uml = {},   -- PlantUML
            maid = {},  -- Mermaid
            disable_sync_scroll = 0,
            sync_scroll_type = "middle",
            hide_yaml_meta = 1, -- hide YAML frontmatter
            sequence_diagrams = {},
            flowchart_diagrams = {},
            content_editable = false,
            disable_filename = 0,
            toc = {},
        }
    end,
}
