require("ali")
require('telescope').setup()

-- LSP Configs
require'lspconfig'.lua_ls.setup{}
require'lspconfig'.yamlls.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.asm_lsp.setup{}

require("obsidian").setup({
  workspaces = {
    {
      name = "work",
      path = "~/obsidian/SecondBrain/SecondBrain",
    },
  }
})

require('lualine').setup{}
require("bufferline").setup{
      options = {
        mode = "tabs",
        themable = true,
        numbers = "ordinal",
        close_command = "bdelete! %d",
        indicator = {
          icon = "▕",
        },
        buffer_close_icon = "",
        modified_icon = " ",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          return "{" .. count .. "}"
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "  Files",
            text_align = "center",
            highlight = "SciVimTab",
            separator = true,
          },
          {
            filetype = "alpha",
            text = " ",
            text_align = "center",
            highlight = "SciVimTab",
          },
          {
            filetype = "termim",
            text = "  Terminal",
            text_align = "center",
            separator = true,
          },
          {
            filetype = "Outline",
            text = " Symbols",
            highlight = "SciVimTab",
            text_align = "center",
            separator = true,
          },
          {
            filetype = "undotree",
            text = "  Undo",
            highlight = "SciVimTab",
            text_align = "center",
            separator = true,
          },
          {
            filetype = "dap-repl",
            text = "  Debugging",
            highlight = "SciVimTab",
            text_align = "center",
            separator = true,
          },
        },
        color_icons = true,

        separator_style = "thin",
        hover = {
          enabled = true,
          delay = 200,
          reveal = { "close" },
        },
      },

}

vim.opt.termguicolors = true

-- Mason Setup
require("mason").setup({
    ui = {
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
        },
    }
})
require("mason-lspconfig").setup()

require('nio')

-- rust Tools
local rt = require("rust-tools")
rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

-- LSP Diagnostics Options Setup 
local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({name = 'DiagnosticSignError', text = ''})
sign({name = 'DiagnosticSignWarn', text = ''})
sign({name = 'DiagnosticSignHint', text = ''})
sign({name = 'DiagnosticSignInfo', text = ''})

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

