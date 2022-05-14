call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'github/copilot.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'StanAngeloff/php.vim'
Plug 'phpactor/phpactor'
Plug 'unblevable/quick-scope'
Plug 'camilledejoye/phpactor-mappings'
Plug 'Chiel92/vim-autoformat'
Plug 'jremmen/vim-ripgrep'
Plug 'sheerun/vim-polyglot'
Plug 'noahfrederick/vim-laravel'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
call plug#end()

" Key bindings
nnoremap <C-p> :FZF<CR>
nnoremap <C-l> :Autoformat<CR>
nnoremap <C-r> :Ripgrep<CR>
nnoremap <C-b> :Buffers<CR>
map <silent> <Space> :noh<CR>

" Tab Settings
set tabstop=4
set shiftwidth=4
set expandtab

" Default split to horisontal
set equalalways

"
" FZF Settings
"
let g:fzf_layout = { 'down': '40%' }

"
" Enable persistent undo
"
set undofile

"
" Enable Line Numbers
"
set number
"set nuw=6
set signcolumn=no 

"
" Git Gutter Customizations
" 
"highlight clear SignColumn
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

"
" Enable Mouse Controls
"
"set mouse=a

"
" Ignore Case
"
set ignorecase

"
" Smart Case
"
set smartcase

"
" Nvim GUI Customizations
"
hi statusline ctermbg=NONE cterm=NONE
"hi CursorLine   cterm=NONE ctermbg=NONE ctermfg=white guibg=NONE guifg=white

syntax on

set t_Co=256

"set cursorline

"colorscheme onehalfdark
"colorscheme mine
"let g:airline_theme='onehalfdark'

