-- Main Neovim configuration entry point
-- This file bootstraps the entire configuration

-- Load plugin configuration first (so plugins are available)
require('plugins')

-- Load core configuration
require('core.options')
require('core.keymaps')
require('core.commands')

-- Set colorscheme after plugins are loaded
local function set_colorscheme()
    local ok, _ = pcall(vim.cmd, "colorscheme cyberdream")
    if not ok then
        vim.cmd("colorscheme default")
        vim.notify("Cyberdream colorscheme not found, using default", vim.log.levels.WARN)
    end
end

set_colorscheme()