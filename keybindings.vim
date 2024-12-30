nnoremap <C-;> :Autoformat<CR>
nnoremap <C-b> :Buffers<CR>

map <silent> <Space> :noh<CR>

noremap <c-space> <cmd>HopWord<CR>
noremap <c-x> <cmd>HopAnywhere<CR>


nmap <leader>cgc :ChatGPTRun complete_code<CR>
nmap <leader>cge :ChatGPTEditWithInstructions<CR>
nmap <leader>cgs :ChatGPTRun summarize<CR>
nmap <leader>cgp :ChatGPTRun optimize_code<CR>
nmap <leader>cgd :ChatGPTRun docstring<CR>
nmap <leader>cgt :ChatGPTRun add_tests<CR>
nmap <leader>cgx :ChatGPTRun explain_code<CR>
nmap <leader>cgo :ChatGPT<CR>

"Tests
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>ta :TestSuite<CR>
nnoremap <leader>tg :TestVisit<CR>
nnoremap <leader>tn :TestNearest<CR>

"Git
nnoremap <leader>gaf :Git add %:p<CR>
nnoremap <leader>grf :Git restore --staged %:p<CR>
nnoremap <leader>gaa :Git add .<CR>
nnoremap <leader>gra :Git restore --staged .<CR>

"Diff view
nnoremap <leader>dvo :DiffviewOpen<CR>
nnoremap <leader>dvc :DiffviewClose<CR>
nnoremap <leader>dvl :DiffviewLog<CR>
nnoremap <leader>dvr :DiffviewRefresh<CR>

nnoremap <leader>ff :Telescope find_files hidden=true<CR>
nnoremap <leader>fg :Telescope live_grep<CR>
nnoremap <leader>fb :Telescope buffers<CR>

nnoremap <C-h> :BufferPrevious<CR>
nnoremap <C-l> :BufferNext<CR>

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>cp :CocCommand prettier.formatFile<CR>

nnoremap <silent> K :call ShowDocumentation()<CR>

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

