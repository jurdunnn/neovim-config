call plug#begin('~/.local/share/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Git
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'lewis6991/gitsigns.nvim'
"End Git
Plug 'tpope/vim-repeat'
Plug 'phaazon/hop.nvim'
Plug 'preservim/nerdtree'
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
Plug 'chentoast/marks.nvim' " Add visual indicators for marks
Plug 'sindrets/diffview.nvim'
Plug 'noahfrederick/vim-laravel'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'sainnhe/edge'
Plug 'brooth/far.vim'
Plug 'vimpostor/vim-tpipeline' "Integrates Nvim statusbar inside tmux statusbar
"Tags
Plug 'preservim/tagbar'
"Tabs
Plug 'nvim-tree/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
"Themes
Plug 'EdenEast/nightfox.nvim'
Plug 'arcticicestudio/nord-vim'
Plug 'sainnhe/sonokai'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
call plug#end()

" Key bindings
nnoremap <C-;> :Autoformat<CR>
nnoremap <C-b> :Buffers<CR>

"Remove highlighting from search
map <silent> <Space> :noh<CR>

" Hop
noremap <c-space> <cmd>HopWord<CR>
noremap <c-x> <cmd>HopAnywhere<CR>

" Telescope
nnoremap <C-p> <cmd>Telescope find_files hidden=true<CR>
nnoremap <C-g> <cmd>Telescope live_grep<CR>
nnoremap <C-b> <cmd>Telescope buffers<CR>

nnoremap <C-h> :BufferPrevious<CR>
nnoremap <C-l> :BufferNext<CR>

" Nerd Tree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Tagbar
nnoremap <C-n> :TagbarToggle<CR>
let g:tagbar_autoclose=1
let g:tagbar_compact=1


" Tab Settings
set tabstop=4
set shiftwidth=4
set expandtab

"Hide bar bar if there is only a singe tab
let bufferline = get(g:, 'bufferline', {})
let bufferline.auto_hide = v:true

"Fugative gitlab 
let g:fugitive_gitlab_domains = ['https://gitlab.enovate.co.uk/']

" COC Tab Remaps
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" COC go to definition
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" COC Show documentation
nnoremap <silent> K :call ShowDocumentation()<CR>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

"Add colour column
set colorcolumn=125

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Default split to horizontal
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

" Backspace to switch between to files
nnoremap <BS> <C-^>

"
" Spell Check
"
set spell
set spelllang=en,cjk
set spellsuggest=best,9

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
colorscheme onehalfdark

" Hop
lua << EOF
require'hop'.setup()
EOF

lua << EOF
require'marks'.setup {
    default_mappings = true,
    builtin_marks = { ".", "<", ">", "^" },
    cyclic = true,
    force_write_shada = false,
    refresh_interval = 250,
    sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
    excluded_filetypes = {},
    bookmark_0 = {
        sign = "⚑",
        virt_text = "hello world",
        annotate = false,
    },
    mappings = {}
}
EOF

lua << EOF
require('gitsigns').setup()
EOF

lua << EOF
require('telescope').setup{
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
            return {"--hidden"}
            end
        },
    },
}
EOF
