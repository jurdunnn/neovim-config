-- UI and navigation plugins

return {
  -- File explorer (modern replacement for NERDTree)
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFile" },
    config = function()
      require("plugins.config.nvim-tree")
    end,
  },

  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    },
    config = function()
      require("plugins.config.telescope")
    end,
  },

  -- Quick navigation
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ha", function() require("harpoon.mark").add_file() end, desc = "Harpoon add file" },
      { "<leader>hh", function() require("harpoon.ui").toggle_quick_menu() end, desc = "Harpoon menu" },
      { "<leader>h1", function() require("harpoon.ui").nav_file(1) end, desc = "Harpoon file 1" },
      { "<leader>h2", function() require("harpoon.ui").nav_file(2) end, desc = "Harpoon file 2" },
      { "<leader>h3", function() require("harpoon.ui").nav_file(3) end, desc = "Harpoon file 3" },
      { "<leader>h4", function() require("harpoon.ui").nav_file(4) end, desc = "Harpoon file 4" },
    },
    config = function()
      require("harpoon").setup()
    end,
  },

  -- Movement (modern replacement for hop.nvim)
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    keys = {
      { "<c-space>", function() require("flash").jump() end, desc = "Flash jump" },
      { "<c-x>", function() require("flash").treesitter() end, desc = "Flash treesitter" },
      { "S", function() require("flash").treesitter() end, mode = { "n", "x", "o" }, desc = "Flash Treesitter" },
    },
    config = function()
      require("flash").setup({
        labels = "etovxqpdygfblzhckisuran",
        search = {
          multi_window = true,
          forward = true,
          wrap = true,
        },
        jump = {
          jumplist = true,
          pos = "start",
          history = false,
          register = false,
          nohlsearch = false,
        },
        label = {
          uppercase = true,
          exclude = "",
          current = true,
          after = true,
          before = false,
          style = "overlay",
        },
        highlight = {
          backdrop = true,
          matches = true,
          priority = 5000,
          groups = {
            match = "FlashMatch",
            current = "FlashCurrent",
            backdrop = "FlashBackdrop",
            label = "FlashLabel",
          },
        },
      })
    end,
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
      require("plugins.config.lualine")
    end,
  },

  -- Buffer line
  {
    "romgrk/barbar.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    keys = {
      { "<C-h>", "<cmd>BufferPrevious<cr>", desc = "Previous buffer" },
      { "<C-l>", "<cmd>BufferNext<cr>", desc = "Next buffer" },
    },
    config = function()
      require("plugins.config.barbar")
    end,
  },

  -- Visual indicators
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins.config.marks")
    end,
  },

  -- Quick scope for f/F/t/T
  {
    "unblevable/quick-scope",
    event = "VeryLazy",
  },

  -- Tmux integration
  {
    "vimpostor/vim-tpipeline",
    cond = function()
      return vim.env.TMUX ~= nil
    end,
    config = function()
      require("plugins.config.tpipeline")
    end,
  },

  -- Tagbar
  {
    "preservim/tagbar",
    cmd = { "TagbarToggle", "TagbarOpen" },
    config = function()
      require("plugins.config.tagbar")
    end,
  },

  -- Enhanced UI notifications
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      vim.notify = require("notify")
      require("notify").setup({
        background_colour = "#000000",
        fps = 30,
        render = "default",
        timeout = 3000,
        top_down = true,
      })
    end,
  },

  -- Better command line UI
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = true,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = false,
          lsp_doc_border = false,
        },
      })
    end,
  },

  -- Show keybinding help
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.setup({
        preset = "modern",
        plugins = {
          spelling = {
            enabled = true,
            suggestions = 20
          }
        },
        win = { border = "rounded" },
      })

      -- Register key groups using new v3 API - organized logically
      wk.add({
        -- AI Assistants
        { "<leader>c", group = "🤖 AI Assistants" },
        { "<leader>cc", desc = "Open Claude Code" },
        { "<leader>cg", group = "ChatGPT" },
        { "<leader>cgc", desc = "Complete code" },
        { "<leader>cge", desc = "Edit with instructions" },
        { "<leader>cgs", desc = "Summarize" },
        { "<leader>cgp", desc = "Optimize code" },
        { "<leader>cgd", desc = "Add docstring" },
        { "<leader>cgt", desc = "Add tests" },
        { "<leader>cgx", desc = "Explain code" },
        { "<leader>cgo", desc = "Open ChatGPT" },

        -- Search & Navigation
        { "<leader>f", group = "🔍 Search & Navigation" },
        { "<leader>ff", desc = "Find files" },
        { "<leader>fg", desc = "Live grep (search in files)" },
        { "<leader>fb", desc = "Buffers" },

        -- File Explorer
        { "<leader>n", group = "📁 File Explorer" },
        { "<leader>n", desc = "Focus file tree" },
        { "<leader>nt", desc = "Toggle file tree" },
        { "<leader>nf", desc = "Find current file in tree" },

        -- Git Operations
        { "<leader>g", group = "🌿 Git Operations" },
        { "<leader>gaf", desc = "Git add current file" },
        { "<leader>gaa", desc = "Git add all" },
        { "<leader>grf", desc = "Git restore current file" },
        { "<leader>gra", desc = "Git restore all" },
        { "<leader>gg", desc = "Neogit (Git interface)" },
        { "<leader>gb", desc = "Toggle git blame" },

        -- Diffview (Git diffs)
        { "<leader>d", group = "📊 Diffview" },
        { "<leader>dvo", desc = "Open diff view" },
        { "<leader>dvc", desc = "Close diff view" },
        { "<leader>dvl", desc = "Diff view log" },
        { "<leader>dvr", desc = "Refresh diff view" },
        { "<leader>dvh", desc = "File history" },

        -- Testing
        { "<leader>t", group = "🧪 Testing" },
        { "<leader>tf", desc = "Test file" },
        { "<leader>ta", desc = "Test suite" },
        { "<leader>tn", desc = "Test nearest" },
        { "<leader>tl", desc = "Test last" },
        { "<leader>tv", desc = "Test visit" },

        -- Diagnostics
        { "<leader>x", group = "🩺 Diagnostics" },
        { "<leader>xx", desc = "Toggle diagnostics panel" },
        { "<leader>xw", desc = "Workspace diagnostics" },
        { "<leader>xd", desc = "Document diagnostics" },
        { "<leader>xl", desc = "Location list" },
        { "<leader>xq", desc = "Quickfix list" },
        { "<leader>xs", desc = "Symbols" },
        { "<leader>xr", desc = "LSP References" },

        -- Harpoon (Quick Navigation)
        { "<leader>h", group = "🎯 Harpoon" },
        { "<leader>ha", desc = "Add file to Harpoon" },
        { "<leader>hh", desc = "Harpoon menu" },
        { "<leader>h1", desc = "Jump to Harpoon file 1" },
        { "<leader>h2", desc = "Jump to Harpoon file 2" },
        { "<leader>h3", desc = "Jump to Harpoon file 3" },
        { "<leader>h4", desc = "Jump to Harpoon file 4" },

        -- Laravel Development
        { "<leader>l", group = "🐘 Laravel/PHP" },
        { "<leader>lc", desc = "Create PHP class" },
        { "<leader>ln", desc = "Create namespace" },
        { "<leader>lf", desc = "Create PHP file" },

        -- Project & Utilities
        { "<leader>p", group = "📋 Project" },
        { "<leader>pp", desc = "Projects (Telescope)" },

        -- Search & Replace
        { "<leader>s", group = "🔄 Search & Replace" },
        { "<leader>sr", desc = "Search and replace (Spectre)" },
      })
    end,
  },

  -- Startup screen
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("plugins.config.alpha")
    end,
  },

  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("ibl").setup({
        indent = {
          char = "│",
          tab_char = "│",
        },
        scope = { enabled = false },
        exclude = {
          filetypes = {
            "help",
            "alpha",
            "dashboard",
            "neo-tree",
            "Trouble",
            "trouble",
            "lazy",
            "mason",
            "notify",
            "toggleterm",
            "lazyterm",
          },
        },
      })
    end,
  },
}