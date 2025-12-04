return {
    "nvim-pack/nvim-spectre",
    config = function()
        require('spectre').setup({
            default = {
                replace = {
                    cmd = "sd"
                }
            }
        })
    end
}
