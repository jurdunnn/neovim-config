call plug#begin('~/.local/share/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'phaazon/hop.nvim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'StanAngeloff/php.vim'
Plug 'phpactor/phpactor'
Plug 'unblevable/quick-scope'
Plug 'camilledejoye/phpactor-mappings'
Plug 'Chiel92/vim-autoformat'
Plug 'jremmen/vim-ripgrep'
Plug 'mattn/emmet-vim'
Plug 'sheerun/vim-polyglot'
Plug 'noahfrederick/vim-laravel'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'sainnhe/edge'
Plug 'arcticicestudio/nord-vim'
Plug 'brooth/far.vim'
call plug#end()

" Key bindings
nnoremap <C-l> :Autoformat<CR>
nnoremap <C-b> :Buffers<CR>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
map <silent> <Space> :noh<CR>

" Hop
noremap <c-space> <cmd>HopWord<CR>

" Telescope
nnoremap <C-p> <cmd>Telescope find_files<CR>
nnoremap <C-g> <cmd>Telescope live_grep<CR>
nnoremap <C-b> <cmd>Telescope buffers<CR>

" Tab Settings
set tabstop=4
set shiftwidth=4
set expandtab

" Default split to horisontal
set equalalways

"
" Enable persistent undo
"
set undofile

"
" Enable Line Numbers
"
set number
set signcolumn=yes

"
" Set Number of rows from cursor to begin scrolling
"
set scrolloff=8

"
" Enable Mouse Controls
"
set mouse=a

"
" Ignore Case
"
set ignorecase

"
" Smart Case
"
set smartcase

" Clip board
set clipboard+=unnamedplus

"
" Nvim GUI Customizations
"
hi statusline ctermbg=NONE cterm=NONE
syntax on
set t_Co=256


" Important!!
if has('termguicolors')
    set termguicolors
endif

"
" Colour Scheme
" 
let g:edge_style = 'aura'
colorscheme nord

" Hop
lua << EOF
require'hop'.setup()
EOF

lua << EOF
require('telescope').setup{
  -- ...
}
EOF
