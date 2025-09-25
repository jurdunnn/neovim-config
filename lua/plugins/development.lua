-- Development and productivity plugins

return {
  -- Treesitter for better syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "windwp/nvim-ts-autotag", -- Auto close HTML tags
      "JoosepAlviste/nvim-ts-context-commentstring", -- Better commenting
    },
    config = function()
      -- Skip the deprecated treesitter module
      vim.g.skip_ts_context_commentstring_module = true

      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash", "c", "html", "javascript", "json", "lua", "markdown",
          "markdown_inline", "php", "python", "query", "regex", "tsx",
          "typescript", "vim", "yaml", "css", "scss", "sql", "dockerfile"
        },
        highlight = { enable = true },
        indent = { enable = true },
        autotag = { enable = true },
      })

      -- Setup ts_context_commentstring separately (new method)
      require('ts_context_commentstring').setup({
        enable_autocmd = false,
      })
    end,
  },

  -- Auto pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        map_cr = false,
      })
    end,
  },

  -- Git conflict resolution
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("git-conflict").setup({
        default_mappings = true,
        default_commands = true,
        disable_diagnostics = false,
        list_opener = 'copen',
        highlights = {
          incoming = 'DiffAdd',
          current = 'DiffText',
        }
      })
    end,
  },

  -- Git blame
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>gb", "<cmd>GitBlameToggle<cr>", desc = "Toggle git blame" },
    },
    config = function()
      require("gitblame").setup({
        enabled = false, -- Don't enable by default
        message_template = " <summary> • <date> • <author>",
        date_format = "%m-%d-%Y",
      })
    end,
  },

  -- Modern Git interface
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    cmd = "Neogit",
    keys = {
      { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
    },
    config = function()
      require("neogit").setup({
        integrations = {
          telescope = true,
          diffview = true,
        },
      })
    end,
  },

  -- Diff view
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles" },
    keys = {
      { "<leader>dvo", "<cmd>DiffviewOpen<cr>", desc = "Diffview open" },
      { "<leader>dvc", "<cmd>DiffviewClose<cr>", desc = "Diffview close" },
      { "<leader>dvh", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview file history" },
    },
  },

  -- Testing
  {
    "vim-test/vim-test",
    cmd = { "TestFile", "TestSuite", "TestNearest", "TestLast", "TestVisit" },
    keys = {
      { "<leader>tf", "<cmd>TestFile<cr>", desc = "Test file" },
      { "<leader>ta", "<cmd>TestSuite<cr>", desc = "Test suite" },
      { "<leader>tn", "<cmd>TestNearest<cr>", desc = "Test nearest" },
      { "<leader>tl", "<cmd>TestLast<cr>", desc = "Test last" },
      { "<leader>tv", "<cmd>TestVisit<cr>", desc = "Test visit" },
    },
    config = function()
      vim.g.test_strategy = "neovim"
      vim.g.test_neovim_term_position = "vert botright"
      vim.g['test#php#phpunit#executable'] = 'php artisan test'
    end,
  },

  -- Async commands
  {
    "tpope/vim-dispatch",
    cmd = { "Dispatch", "Make", "Focus", "Start" },
  },

  -- Project helpers
  {
    "tpope/vim-projectionist",
    event = "VeryLazy",
  },

  -- Search and replace with preview
  {
    "nvim-pack/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>sr", function() require("spectre").toggle() end, desc = "Replace in files (Spectre)" },
    },
    config = function()
      require("spectre").setup()
    end,
  },

  -- Better quickfix
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    config = function()
      require("bqf").setup({
        auto_enable = true,
        preview = {
          win_height = 12,
          win_vheight = 12,
          delay_syntax = 80,
          border = "rounded",
        },
        func_map = {
          vsplit = "",
          ptogglemode = "z,",
          stoggleup = "",
        },
        filter = {
          fzf = {
            action_for = { ["ctrl-s"] = "split" },
            extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
          },
        },
      })
    end,
  },

  -- Diagnostics panel (keybindings in core/keymaps.lua)
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "Trouble" },
    opts = {
      modes = {
        diagnostics = {
          auto_open = false,
          auto_close = true,
        },
      },
    },
  },

  -- Modern folding
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    event = "BufReadPost",
    keys = {
      { "zR", function() require("ufo").openAllFolds() end, desc = "Open all folds" },
      { "zM", function() require("ufo").closeAllFolds() end, desc = "Close all folds" },
      { "zr", function() require("ufo").openFoldsExceptKinds() end, desc = "Open folds except kinds" },
      { "zm", function() require("ufo").closeFoldsWith() end, desc = "Close folds with" },
    },
    config = function()
      require("ufo").setup({
        provider_selector = function(bufnr, filetype, buftype)
          return { "treesitter", "indent" }
        end,
      })
    end,
  },
}
