-- Telescope configuration

require('telescope').setup({
    defaults = {
        file_ignore_patterns = {
            "vendor",
            "node_modules",
            ".git",
        }
    },
    pickers = {
        live_grep = {
            additional_args = function(opts)
                return { "--hidden" }
            end
        },
    },
})