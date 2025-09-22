-- AI and productivity plugins

return {
  -- GitHub Copilot
  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      -- Set up keybindings
      vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
        desc = "Accept Copilot suggestion"
      })
      vim.keymap.set("i", "<C-L>", "<Plug>(copilot-accept-word)", { desc = "Accept Copilot word" })
    end,
  },

  -- ChatGPT integration
  {
    "jackMort/ChatGPT.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim"
    },
    cmd = {
      "ChatGPT",
      "ChatGPTRun",
      "ChatGPTActAs",
      "ChatGPTCompleteCode",
      "ChatGPTEditWithInstructions",
    },
    keys = {
      { "<leader>cgc", "<cmd>ChatGPTRun complete_code<cr>", desc = "Complete code" },
      { "<leader>cge", "<cmd>ChatGPTEditWithInstructions<cr>", desc = "Edit with instructions" },
      { "<leader>cgs", "<cmd>ChatGPTRun summarize<cr>", desc = "Summarize" },
      { "<leader>cgp", "<cmd>ChatGPTRun optimize_code<cr>", desc = "Optimize code" },
      { "<leader>cgd", "<cmd>ChatGPTRun docstring<cr>", desc = "Add docstring" },
      { "<leader>cgt", "<cmd>ChatGPTRun add_tests<cr>", desc = "Add tests" },
      { "<leader>cgx", "<cmd>ChatGPTRun explain_code<cr>", desc = "Explain code" },
      { "<leader>cgo", "<cmd>ChatGPT<cr>", desc = "Open ChatGPT" },
    },
    config = function()
      require("plugins.config.chatgpt")
    end,
  },

  -- Claude Code integration (Advanced WebSocket MCP Protocol)
  {
    "coder/claudecode.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "ClaudeCode" },
    keys = {
      { "<C-,>", "<cmd>ClaudeCode<cr>", mode = { "n", "t" }, desc = "Toggle Claude Code" },
      { "<leader>cc", "<cmd>ClaudeCode<cr>", desc = "Open Claude Code" },
    },
    config = function()
      require("claudecode").setup({
        -- Terminal configuration
        terminal = {
          split_side = "right",
          split_width_percentage = 0.3,
          auto_close = false,
        },
        -- Working directory setup
        git_repo_cwd = true,
        -- Focus terminal after sending context
        focus_after_send = true,
      })
    end,
  },

  -- gp.nvim - Advanced AI plugin with GPT-4/Codex support
  {
    "robitx/gp.nvim",
    cmd = {
      "GpChatNew", "GpChatPaste", "GpChatToggle", "GpChatFinder",
      "GpRewrite", "GpAppend", "GpPrepend", "GpEnew", "GpNew", "GpVnew",
      "GpTabnew", "GpPopup", "GpImplement", "GpContext", "GpNextAgent",
      "GpAgent", "GpWhisper", "GpWhisperRewrite", "GpWhisperAppend",
      "GpWhisperPrepend", "GpWhisperEnew", "GpWhisperNew", "GpWhisperVnew",
      "GpWhisperTabnew", "GpWhisperPopup", "GpImage", "GpStop"
    },
    keys = {
      { "<leader>ga", "<cmd>GpAppend<cr>", mode = { "n", "v" }, desc = "GP Append" },
      { "<leader>gr", "<cmd>GpRewrite<cr>", mode = { "n", "v" }, desc = "GP Rewrite" },
      { "<leader>go", "<cmd>GpChatNew<cr>", desc = "GP New Chat" },
      { "<leader>gs", "<cmd>GpRewrite summarize this code<cr>", mode = { "n", "v" }, desc = "GP Summarize" },
      { "<leader>ge", "<cmd>GpRewrite explain this code<cr>", mode = { "n", "v" }, desc = "GP Explain" },
      { "<leader>gp", "<cmd>GpRewrite optimize this code<cr>", mode = { "n", "v" }, desc = "GP Optimize" },
      { "<leader>gd", "<cmd>GpRewrite add documentation to this code<cr>", mode = { "n", "v" }, desc = "GP Document" },
      { "<leader>gt", "<cmd>GpRewrite add unit tests for this code<cr>", mode = { "n", "v" }, desc = "GP Test" },
      { "<leader>gf", "<cmd>GpRewrite fix any bugs in this code<cr>", mode = { "n", "v" }, desc = "GP Fix" },
    },
    config = function()
      local conf = {
        openai_api_key = vim.env.OPENAI_API_KEY,
        providers = {
          openai = {
            endpoint = "https://api.openai.com/v1/chat/completions",
            secret = vim.env.OPENAI_API_KEY,
          },
        },
        agents = {
          {
            provider = "openai",
            name = "CodeGPT4",
            chat = true,
            command = true,
            model = { model = "gpt-4", temperature = 0.1, top_p = 0.1 },
            system_prompt = require("gp.defaults").chat_system_prompt,
          },
          {
            provider = "openai",
            name = "CodeGPT4o",
            chat = true,
            command = true,
            model = { model = "gpt-4o", temperature = 0.1, top_p = 0.1 },
            system_prompt = "You are a general AI assistant for code-related tasks.\n\n"
              .. "The user provided the following context:\n"
              .. "{{command}}\n\n"
              .. "Please respond to the user's request for code help, optimization, explanation, or any other code-related task.",
          },
        },
        chat_dir = vim.fn.stdpath("data"):gsub("/$", "") .. "/gp/chats",
        chat_user_prefix = "🗨:",
        chat_assistant_prefix = { "🤖:", "[{{agent}}]" },
        chat_topic_gen_prompt = "Summarize the topic of our conversation above"
          .. " in two or three words. Respond only with those words.",
        chat_confirm_delete = true,
        chat_conceal_model_params = true,
        chat_shortcut_respond = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g><C-g>" },
        chat_shortcut_delete = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g>d" },
        chat_shortcut_stop = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g>s" },
        chat_shortcut_new = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g>c" },
        command_prompt_prefix_template = "🤖 {{agent}} ~ ",
        command_auto_select_response = true,
      }
      require("gp").setup(conf)
    end,
  },
}
