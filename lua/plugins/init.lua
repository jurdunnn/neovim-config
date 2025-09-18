-- Plugin management with vim-plug

-- Initialize vim-plug
vim.cmd [[
call plug#begin('~/.local/share/nvim/plugged')

" Core functionality
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-repeat'
Plug 'phaazon/hop.nvim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" Language support
Plug 'StanAngeloff/php.vim'
Plug 'phpactor/phpactor'
Plug 'camilledejoye/phpactor-mappings'
Plug 'sheerun/vim-polyglot'

" UI and navigation
Plug 'unblevable/quick-scope'
Plug 'jremmen/vim-ripgrep'
Plug 'mattn/emmet-vim'
Plug 'chentoast/marks.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'brooth/far.vim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'vimpostor/vim-tpipeline'
Plug 'preservim/tagbar'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'nvim-treesitter/nvim-treesitter'

" Testing and development
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'vim-test/vim-test'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
Plug 'noahfrederick/vim-composer'
Plug 'noahfrederick/vim-laravel'

" AI and productivity
Plug 'jackMort/ChatGPT.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'greggh/claude-code.nvim'

" Theme
Plug 'scottmckendry/cyberdream.nvim'

call plug#end()
]]

-- Load plugin configurations
require('plugins.config.coc')
require('plugins.config.hop')
require('plugins.config.marks')
require('plugins.config.gitsigns')
require('plugins.config.lualine')
require('plugins.config.tpipeline')
require('plugins.config.chatgpt')
require('plugins.config.telescope')
require('plugins.config.tagbar')
require('plugins.config.barbar')
require('plugins.config.fugitive')
require('plugins.config.claude-code')
