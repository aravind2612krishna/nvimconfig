return {
    "lukas-reineke/indent-blankline.nvim",
    options = {
        scope = {enabled = true, show_start = true},
    },
    setup = function(_,options)
        require('ibl').setup(options)
    end
}
