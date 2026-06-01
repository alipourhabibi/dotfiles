return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
        { "j-hui/fidget.nvim",                opts = {} },
        {
            "akinsho/flutter-tools.nvim",
            lazy = false,
            dependencies = { "nvim-lua/plenary.nvim" },
        },
        {
            "folke/lazydev.nvim",
            ft = "lua",
            opts = {
                library = {
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },
    },
    config = function()
        require("mason").setup()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("lsp", { clear = true }),
            callback = function(args)
                local opts = { buffer = args.buf, silent = true }
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
            end,
        })
        local original_capabilities = vim.lsp.protocol.make_client_capabilities()
        local capabilities = require("blink.cmp").get_lsp_capabilities(original_capabilities)
        local servers = {
            rust_analyzer = {
                settings = {
                    ["rust-analyzer"] = {
                        diagnostics = {
                            enable = true,
                            experimental = {
                                enable = true,
                            },
                        },
                    },
                },
            },
            lua_ls = {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            },
            clangd = {},
            gopls = {},
        }
        require("mason-lspconfig").setup({
            ensure_installed = vim.tbl_keys(servers or {}),
            automatic_installation = false,
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                    require("lspconfig")[server_name].setup(server)
                end,
            },
        })

        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*.proto",
            callback = function()
                vim.cmd("silent! write")
                vim.fn.system({ "buf", "format", "-w", vim.fn.expand("%") })
                vim.cmd("edit!")
            end,
        })

        -- Flutter handled separately via flutter-tools (not mason-lspconfig)
        -- because dartls is bundled with Flutter SDK, not installed via mason
        require("flutter-tools").setup({
            ui = { border = "rounded" },
            widget_guides = { enabled = true },
            lsp = {
                capabilities = capabilities,
                settings = {
                    showTodos = true,
                    completeFunctionCalls = true,
                },
            },
        })
    end,
}
