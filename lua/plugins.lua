return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Lazy loading:
  -- Load on specific commands
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- Load on an autocommand event
  use {'andymass/vim-matchup', event = 'VimEnter'}

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  use {
    'w0rp/ale',
    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }

  use 'kyazdani42/nvim-web-devicons';
    use {
        'haorenW1025/completion-nvim',
        opt = true,
        requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
    }

    use {
        'kyazdani42/nvim-tree.lua',
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

  use({ -- Configure LSP client and Use an LSP server installer.
     "neovim/nvim-lspconfig",
     requires = {
      "williamboman/nvim-lsp-installer", -- Installs servers within neovim
      "onsails/lspkind-nvim",            -- adds vscode-like pictograms to neovim built-in lsp
     },
     config = function()
      require("config.lsp")
     end,
    })

    use({ -- CMP completion engine
     "hrsh7th/nvim-cmp",
     requires = {
      "onsails/lspkind-nvim",     -- Icons on the popups
      "hrsh7th/cmp-nvim-lsp",     -- LSP source for nvim-cmp
      "saadparwaiz1/cmp_luasnip", -- Snippets source
      "L3MON4D3/LuaSnip",         -- Snippet engine
     },
     config = function()
      require("config.cmp")
     end,
    })

  -- You can specify rocks in isolation
  use_rocks 'penlight'
  use_rocks {'lua-resty-http', 'lpeg'}

  use {'ojroques/nvim-hardline'}
  use {'tpope/vim-commentary'}
  use {'tpope/vim-surround'}
  use {'tpope/vim-abolish'}
  use {'tpope/vim-repeat'}
  use {'tpope/vim-fugitive'}
  use { 'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
          require("config.treesitter")
        end,
    }

  use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

  --THEMES
  use 'bluz71/vim-nightfly-guicolors'
  use 'arcticicestudio/nord-vim'

  use {
      'phaazon/hop.nvim',
      branch = 'v1', -- optional but strongly recommended
      config = function()
        -- you can configure Hop the way you like here; see :h hop-config
        require'hop'.setup { keys = 'wasd' }
      end
  }


  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Use dependency and run lua function after load
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }

  -- You can alias plugin names
  use {'dracula/vim', as = 'dracula'}
end)
