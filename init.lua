-- Main Neovim configuration entry point
-- This file bootstraps the entire configuration

-- Load lazy.nvim plugin manager
require("config.lazy")

-- Load core configuration
require('core.options')
require('core.keymaps')
require('core.commands')

-- Note: Colorscheme is now loaded by the colorscheme plugin spec