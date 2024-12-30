source ~/.config/nvim/plug.vim " Load the plugin manager
source ~/.config/nvim/keybindings.vim " Load the keybindings
source ~/.config/nvim/plugin-settings.vim " Load the plugin settings
source ~/.config/nvim/commands.vim " Load the custom commands file

set tabstop=4 " Set the tab width
set colorcolumn=125 " Set the color column
set shiftwidth=4 " Set the number of spaces inserted for indentation
set expandtab " Use spaces instead of tabs
xmap <leader>f  <Plug>(coc-format-selected) " Format selected text
nmap <leader>f  <Plug>(coc-format-selected) " Format selected text
set equalalways " Make splits equal by default
set undofile " Enable persistent undo
set number " Show line numbers
set signcolumn=yes " Always show the sign column
set scrolloff=8 " Number of rows from cursor to begin scrolling
nnoremap <BS> <C-^> " Switch between files with backspace
set spell " Enable spell check
set spelllang=en,cjk " Set the languages to spell check
set spellsuggest=best,9 " Set the number of suggestions to show
set mouse=a " Enable mouse controls
set ignorecase " Ignore case when searching...
set smartcase " ... unless there is a capital letter in the search
set clipboard+=unnamedplus " Use system clipboard
hi statusline ctermbg=NONE cterm=NONE " Remove the statusline background
syntax on " Enable syntax highlighting
set t_Co=256 " Enable 256 colors
set timeoutlen=2000 " Set the timeout length for leader key

" Enable 24-bit RGB color in the TUI
if has('termguicolors')
    set termguicolors
endif

" colorscheme vscode
colorscheme onedark_vivid

" make test commands execute using dispatch.vim
let test#strategy = "neovim"
let test#neovim#term_position = "vert botright"
let test#php#phpunit#executable = 'php artisan test'
