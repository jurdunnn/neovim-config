-- Telescope configuration

local ok, telescope = pcall(require, 'telescope')
if not ok then
  vim.notify("Telescope not available", vim.log.levels.ERROR)
  return
end

telescope.setup({
    defaults = {
        file_ignore_patterns = {
            "vendor",
            "node_modules",
            ".git",
        },
        layout_config = {
            horizontal = {
                preview_width = 0.6,
            },
        },
    },
    pickers = {
        live_grep = {
            additional_args = function(opts)
                return { "--hidden" }
            end
        },
        find_files = {
            hidden = true,
        },
    },
    extensions = {
        -- Extensions will be loaded by individual plugins
    },
})