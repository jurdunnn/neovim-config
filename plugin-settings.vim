" COC Settings
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

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

lua << END
require('lualine').setup({
    options = { 
        theme = 'vscode',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
    }
})
END

lua << EOF
require("chatgpt").setup({
    api_key_cmd = "",
    openai_params = {
        model = "gpt-4-1106-preview",
        frequency_penalty = 0,
        presence_penalty = 0,
        max_tokens = 600,
        temperature = 0,
        top_p = 1,
        n = 1,
    },
    openai_edit_params = {
        model = "gpt-4-1106-preview",
        frequency_penalty = 0,
        presence_penalty = 0,
        temperature = 0,
        top_p = 1,
        n = 1,
    },
})
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

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


let g:tagbar_autoclose=1
let g:tagbar_compact=1

"Hide bar bar if there is only a singe tab
let bufferline = get(g:, 'bufferline', {})
let bufferline.auto_hide = v:true

"Fugative gitlab 
let g:fugitive_gitlab_domains = ['https://gitlab.enovate.co.uk/']

