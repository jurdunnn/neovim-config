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

" .vimrc
" You can also use Lua for configuration, see :h lua-vim-variables for help
let g:tpipeline_autoembed = 0
" tpipeline comes bundled with its own custom minimal statusline
let g:tpipeline_statusline = '%!tpipeline#stl#line()'
" You can also use standard statusline syntax, see :help stl
let g:tpipeline_statusline = '%f'

lua << EOF
require("chatgpt").setup({
    openai_params = {
        model = "gpt-4o",
    },
    openai_edit_params = {
        model = "gpt-4o",
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


" FZF
lua << EOF
    require("claude-code").setup({
      -- Terminal window settings
      window = {
        split_ratio = 0.3,      -- Percentage of screen for the terminal window (height for horizontal, width for vertical splits)
        position = "botright",  -- Position of the window: "botright", "topleft", "vertical", "rightbelow vsplit", etc.
        enter_insert = true,    -- Whether to enter insert mode when opening Claude Code
        hide_numbers = true,    -- Hide line numbers in the terminal window
        hide_signcolumn = true, -- Hide the sign column in the terminal window
      },
      -- File refresh settings
      refresh = {
        enable = true,           -- Enable file change detection
        updatetime = 100,        -- updatetime when Claude Code is active (milliseconds)
        timer_interval = 1000,   -- How often to check for file changes (milliseconds)
        show_notifications = true, -- Show notification when files are reloaded
      },
      -- Git project settings
      git = {
        use_git_root = true,     -- Set CWD to git root when opening Claude Code (if in git project)
      },
      -- Command settings
      command = "claude",        -- Command used to launch Claude Code
      -- Command variants
      command_variants = {
        -- Conversation management
        continue = "--continue", -- Resume the most recent conversation
        resume = "--resume",     -- Display an interactive conversation picker
        
        -- Output options
        verbose = "--verbose",   -- Enable verbose logging with full turn-by-turn output
      },
      -- Keymaps
      keymaps = {
        toggle = {
          normal = "<C-,>",       -- Normal mode keymap for toggling Claude Code, false to disable
          terminal = "<C-,>",     -- Terminal mode keymap for toggling Claude Code, false to disable
          variants = {
            continue = "<leader>cC", -- Normal mode keymap for Claude Code with continue flag
            verbose = "<leader>cV",  -- Normal mode keymap for Claude Code with verbose flag
          },
        },
        window_navigation = true, -- Enable window navigation keymaps (<C-h/j/k/l>)
        scrolling = true,         -- Enable scrolling keymaps (<C-f/b>) for page up/down
      }
    })
EOF
