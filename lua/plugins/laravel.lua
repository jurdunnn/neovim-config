-- Laravel and PHP specific plugins

return {
  -- Laravel development tools (disabled due to nio errors)
  -- {
  --   "adalessa/laravel.nvim",
  --   dependencies = {
  --     "nvim-telescope/telescope.nvim",
  --     "tpope/vim-dotenv",
  --     "MunifTanjim/nui.nvim",
  --     "kevinhwang91/promise-async",
  --     "nvim-neotest/nvim-nio", -- Required for Laravel.nvim
  --   },
  --   cmd = { "Laravel" },
  --   keys = {
  --     { "<leader>la", "<cmd>Laravel artisan<cr>", desc = "Laravel artisan" },
  --     { "<leader>lr", "<cmd>Laravel routes<cr>", desc = "Laravel routes" },
  --     { "<leader>lm", "<cmd>Laravel related<cr>", desc = "Laravel related files" },
  --   },
  --   enabled = false, -- Temporarily disabled
  -- },

  -- PHP tools
  {
    "ccaglak/phptools.nvim",
    keys = {
      { "<leader>lc", "<cmd>PhpCreateClass<cr>", desc = "Create PHP class" },
      { "<leader>ln", "<cmd>PhpCreateNamespace<cr>", desc = "Create PHP namespace" },
      { "<leader>lf", "<cmd>PhpCreateFile<cr>", desc = "Create PHP file" },
    },
    config = function()
      require("phptools").setup()
    end,
  },

  -- Composer integration
  {
    "noahfrederick/vim-composer",
    ft = "php",
    cmd = { "Composer" },
  },

  -- Laravel specific helpers
  {
    "noahfrederick/vim-laravel",
    ft = "php",
    dependencies = { "tpope/vim-projectionist", "noahfrederick/vim-composer" },
  },

  -- Environment file support
  {
    "tpope/vim-dotenv",
    ft = { "sh", "zsh" },
  },

  -- Emmet for HTML/CSS
  {
    "mattn/emmet-vim",
    ft = { "html", "css", "scss", "javascript", "typescript", "php", "blade" },
    config = function()
      vim.g.user_emmet_mode = 'a'
      vim.g.user_emmet_leader_key = '<C-e>'
    end,
  },

  -- Ripgrep integration
  {
    "jremmen/vim-ripgrep",
    cmd = { "Rg", "RgRoot" },
  },

  -- Find and replace
  {
    "brooth/far.vim",
    cmd = { "Far", "Farp", "F" },
    config = function()
      vim.g['far#enable_undo'] = 1
    end,
  },

  -- Fix cursor hold performance
  {
    "antoinemadec/FixCursorHold.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      vim.g.cursorhold_updatetime = 100
    end,
  },
}