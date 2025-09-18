-- Core Neovim options and settings

local opt = vim.opt
local g = vim.g

-- Display
opt.termguicolors = true
opt.number = true
opt.signcolumn = "yes"
opt.colorcolumn = "125"
opt.scrolloff = 8
opt.mouse = "a"

-- Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- Splits
opt.equalalways = true

-- Undo
opt.undofile = true

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Folding
opt.foldcolumn = "0"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

-- Spell checking
opt.spell = true
opt.spelllang = { "en", "cjk" }
opt.spellsuggest = "best,9"

-- Syntax highlighting
vim.cmd("syntax on")

-- Leader timeout
opt.timeoutlen = 2000

-- Remove statusline background
vim.cmd("hi statusline ctermbg=NONE cterm=NONE")

-- Colorscheme will be set after plugins are loaded

-- Test settings for vim-test
g.test_strategy = "neovim"
g.test_neovim_term_position = "vert botright"
g.test_php_phpunit_executable = "php artisan test"