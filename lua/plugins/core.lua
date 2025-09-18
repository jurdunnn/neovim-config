-- Core plugins for essential functionality

return {
  -- LSP and completion
  {
    "neoclide/coc.nvim",
    branch = "release",
    event = "VimEnter",
    config = function()
      require("plugins.config.coc")
    end,
  },

  -- Git integration
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "Gwrite", "Gread", "Gdiffsplit", "Gvdiffsplit" },
    config = function()
      require("plugins.config.fugitive")
    end,
  },
  {
    "shumphrey/fugitive-gitlab.vim",
    dependencies = { "tpope/vim-fugitive" },
    lazy = true,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("plugins.config.gitsigns")
    end,
  },

  -- Text objects and editing
  {
    "tpope/vim-repeat",
    event = "VeryLazy",
  },
  {
    "tpope/vim-abolish",
    cmd = { "Abolish", "Subvert" },
  },
  {
    "kylechui/nvim-surround", -- Modern replacement for vim-surround
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  {
    "numToStr/Comment.nvim", -- Modern replacement for vim-commentary
    event = "VeryLazy",
    config = function()
      require("Comment").setup()
    end,
  },

  -- Language support
  {
    "StanAngeloff/php.vim",
    ft = "php",
  },
  {
    "phpactor/phpactor",
    ft = "php",
    build = "composer install --no-dev --optimize-autoloader",
  },
  {
    "camilledejoye/phpactor-mappings",
    dependencies = { "phpactor/phpactor" },
    ft = "php",
  },
  {
    "sheerun/vim-polyglot",
    event = { "BufReadPre", "BufNewFile" },
  },

  -- Essential dependencies
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },
  {
    "MunifTanjim/nui.nvim",
    lazy = true,
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
}