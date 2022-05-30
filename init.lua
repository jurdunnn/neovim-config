require("keybindings")
require("layout")
require("plugins")

--Plugin Setup
require('hardline').setup { }
require('hop').setup { }
require('nvim-tree').setup { }
require('gitsigns').setup { 
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
}


local opt = vim.opt
local wo = vim.wo

--Colour Scheme
opt.termguicolors = true
opt.background = 'dark'
--vim.cmd('colorscheme default')
vim.cmd('colorscheme nord')

--Enable Mouse
opt.mouse = 'a'

--Line Numbers
wo.number = true

--Tab Settings
opt.expandtab = true
opt.smarttab = true
opt.shiftwidth = 4
opt.tabstop = 4

opt.completeopt = { "menu" , "menuone" , "noselect", "noinsert" }

opt.ignorecase = true
opt.smartcase = true

opt.shortmess:append("c")
opt.encoding = "utf-8"
opt.cmdheight=2
