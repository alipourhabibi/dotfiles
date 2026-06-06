return {
    "norcalli/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("colorizer").setup({
            "*",               -- highlight all filetypes
            css = {
                rgb_fn = true, -- enable rgb(...) and rgba()
                hsl_fn = true, -- enable hsl(...) and hsla()
                css    = true, -- enable all CSS features
            },
            html = {
                names = false, -- disable named colors like "Blue"
                mode  = "foreground",
            },
        }, {
            -- default options for all filetypes
            RGB      = true,
            RRGGBB   = true,
            names    = true,
            RRGGBBAA = false,
            rgb_fn   = false,
            hsl_fn   = false,
            mode     = "background", -- or "foreground"
        })
    end,
}
