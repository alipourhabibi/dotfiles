return {
    "saghen/blink.cmp",
    dependencies = {
        "rafamadriz/friendly-snippets",
        { "echasnovski/mini.pairs", version = "*", opts = {} },
    },
    version = "1.*",
    opts = {
        keymap = { preset = "enter" },
        appearance = {
            nerd_font_variant = "normal",
        },
        cmdline = {
            keymap = {
                ["<CR>"] = { "accept_and_enter", "fallback" },
            },
        },
        completion = {
            documentation = { auto_show = false },
            menu = {
                draw = {
                    columns = {
                        { "label",      "label_description", gap = 1 },
                        { "kind" },
                        { "source_name" },
                    },
                },
            },
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
}
