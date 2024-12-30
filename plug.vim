call plug#begin('~/.local/share/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'} " Autocomplete
Plug 'tpope/vim-fugitive' " Git integration
Plug 'shumphrey/fugitive-gitlab.vim' " Gitlab integration
Plug 'lewis6991/gitsigns.nvim' " Git signs
Plug 'tpope/vim-repeat' " Repeat
Plug 'phaazon/hop.nvim' " Hop
Plug 'preservim/nerdtree' " File explorer
Plug 'tpope/vim-abolish' " Abbreviations
Plug 'tpope/vim-surround' " Surround
Plug 'tpope/vim-commentary' " Commenting
Plug 'StanAngeloff/php.vim' " PHP
Plug 'phpactor/phpactor' " PHPactor
Plug 'unblevable/quick-scope' " Quick scope
Plug 'camilledejoye/phpactor-mappings' " PHPactor mappings
Plug 'jremmen/vim-ripgrep' " Search
Plug 'mattn/emmet-vim' " Emmet
Plug 'jackMort/ChatGPT.nvim' " ChatGPT
Plug 'MunifTanjim/nui.nvim' " UI
Plug 'sheerun/vim-polyglot' " Syntax highlighting
Plug 'chentoast/marks.nvim' " Add visual indicators for marks
Plug 'sindrets/diffview.nvim' " View diffs
Plug 'tpope/vim-dispatch' " Async commands
Plug 'tpope/vim-projectionist' " Project helpers
Plug 'noahfrederick/vim-composer' " Composer helpers
Plug 'noahfrederick/vim-laravel' " Laravel helpers
Plug 'nvim-lua/plenary.nvim' " Required for telescope
Plug 'nvim-telescope/telescope.nvim' " Fuzzy finder
Plug 'windwp/nvim-autopairs' " Auto pairs
Plug 'brooth/far.vim' " Find and replace
Plug 'nvim-lualine/lualine.nvim' " Statusline
Plug 'vimpostor/vim-tpipeline' "Integrates Nvim statusbar inside tmux statusbar
Plug 'preservim/tagbar'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'romgrk/barbar.nvim', { 'commit': '79f7d16578a167bdf5355725551ef7d90613a601' }
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'nvim-neotest/neotest'
Plug 'theutz/neotest-pest'
Plug 'vim-test/vim-test' "Test runner

"Themes
Plug 'NTBBloodbath/doom-one.nvim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'folke/tokyonight.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'Mofiqul/vscode.nvim'
Plug 'oxfist/night-owl.nvim'
Plug 'olimorris/onedarkpro.nvim'

call plug#end()
