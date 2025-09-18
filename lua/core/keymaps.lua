--[[
═══════════════════════════════════════════════════════════════════════════════════
                           NEOVIM KEYBINDINGS CHEATSHEET
═══════════════════════════════════════════════════════════════════════════════════

ESSENTIALS (no leader):
  <BS>        - Switch between files (alternate)
  <Space>     - Clear search highlight
  K           - Show documentation
  <C-h/l>     - Navigate buffers (previous/next)
  <C-b>       - Show buffers list
  <C-;>       - Autoformat
  <C-Space>   - Flash jump to word
  <C-x>       - Flash treesitter jump
  <C-,>       - Toggle Claude Code (normal/terminal mode)

LSP & CODE NAVIGATION:
  gd          - Go to definition
  gy          - Go to type definition
  gi          - Go to implementation
  gr          - Go to references
  \rn         - Rename symbol
  \f          - Format selected text

SEARCH & NAVIGATION (\f*):
  \ff         - Find files
  \fg         - Live grep (search in files)
  \fb         - Buffers

FILE EXPLORER (\n*):
  \n          - Focus file tree
  \nt         - Toggle file tree
  \nf         - Find current file in tree

GIT OPERATIONS (\g*):
  \gaf        - Git add current file
  \gaa        - Git add all
  \grf        - Git restore current file
  \gra        - Git restore all
  \gg         - Neogit (Git interface)
  \gb         - Toggle git blame

DIFFVIEW (\d*):
  \dvo        - Open diff view
  \dvc        - Close diff view
  \dvl        - Diff view log
  \dvr        - Refresh diff view
  \dvh        - File history

AI ASSISTANTS:
  ChatGPT (\cg*):
    \cgc      - Complete code
    \cge      - Edit with instructions
    \cgs      - Summarize
    \cgp      - Optimize code
    \cgd      - Add docstring
    \cgt      - Add tests
    \cgx      - Explain code
    \cgo      - Open ChatGPT

  Claude Code (\c*):
    \cc       - Open Claude Code
    \cC       - Continue conversation
    \cV       - Verbose mode

  GP.nvim (GPT-4) (\g*):
    \ga       - GP Append
    \gr       - GP Rewrite
    \go       - GP New Chat
    \gs       - GP Summarize
    \ge       - GP Explain
    \gp       - GP Optimize
    \gd       - GP Document
    \gt       - GP Test
    \gf       - GP Fix

TESTING (\t*):
  \tf         - Test file
  \ta         - Test suite
  \tn         - Test nearest
  \tl         - Test last
  \tv         - Test visit

DIAGNOSTICS (\x*):
  \xx         - Toggle diagnostics panel
  \xw         - Workspace diagnostics
  \xd         - Document diagnostics
  \xl         - Location list
  \xq         - Quickfix list
  \xs         - Symbols
  \xr         - LSP references

HARPOON (\h*):
  \ha         - Add file to Harpoon
  \hh         - Harpoon menu
  \h1-4       - Jump to Harpoon file 1-4

PROJECT & UTILITIES:
  \pp         - Projects (Telescope)
  \sr         - Search and replace (Spectre)

LARAVEL (\l*):
  \lc         - Create PHP class
  \ln         - Create namespace
  \lf         - Create PHP file

COMPLETION (Insert mode):
  <Tab>       - Confirm CoC, jump snippet, or accept Copilot
  <S-Tab>     - Previous completion / snippet back
  <CR>        - Confirm completion
  <C-J>       - Accept Copilot (Insert mode)
  <C-L>       - Accept Copilot word (Insert mode)

═══════════════════════════════════════════════════════════════════════════════════
--]]

-- Core keybindings - All keybindings centralized for easy management
local map = vim.keymap.set

local function should_insert_tab()
  local col = vim.fn.col('.') - 1
  if col <= 0 then
    return true
  end
  return vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

local function termcodes(key)
  return vim.api.nvim_replace_termcodes(key, true, true, true)
end

local function coc_snippet_jump()
  local ok, jumpable = pcall(function()
    return vim.fn['coc#expandableOrJumpable']()
  end)
  if ok and jumpable == 1 then
    return termcodes('<Plug>(coc-snippets-expand-jump)')
  end
end

local function copilot_accept_tab()
  local ok, accepted = pcall(function()
    return vim.fn['copilot#Accept']('<Tab>')
  end)
  if not ok or not accepted or accepted == '' then
    return nil
  end
  if accepted == '<Tab>' or accepted == '\t' then
    return nil
  end
  return accepted
end

-- Use default leader key (backslash \)

--═══════════════════════════════════════════════════════════════════════════════════
-- ESSENTIALS - Core functionality without leader
--═══════════════════════════════════════════════════════════════════════════════════

map("n", "<BS>", "<C-^>", { desc = "Switch between files" })
map("n", "<Space>", ":noh<CR>", { desc = "Clear search highlight", silent = true })
map("n", "K", "<cmd>lua ShowDocumentation()<CR>", { desc = "Show documentation", silent = true })

-- Buffer navigation
map("n", "<C-b>", ":Buffers<CR>", { desc = "Show buffers" })
map("n", "<C-h>", ":BufferPrevious<CR>", { desc = "Previous buffer" })
map("n", "<C-l>", ":BufferNext<CR>", { desc = "Next buffer" })

-- Quick formatting
map("n", "<C-;>", ":Autoformat<CR>", { desc = "Autoformat" })

--═══════════════════════════════════════════════════════════════════════════════════
-- LSP & CODE NAVIGATION - Language server and code actions
--═══════════════════════════════════════════════════════════════════════════════════

-- LSP navigation
map("n", "gd", "<Plug>(coc-definition)", { desc = "Go to definition", silent = true })
map("n", "gy", "<Plug>(coc-type-definition)", { desc = "Go to type definition", silent = true })
map("n", "gi", "<Plug>(coc-implementation)", { desc = "Go to implementation", silent = true })
map("n", "gr", "<Plug>(coc-references)", { desc = "Go to references", silent = true })
map("n", "<leader>rn", "<Plug>(coc-rename)", { desc = "Rename symbol", silent = true })

-- Formatting
map({ "x", "n" }, "<leader>f", "<Plug>(coc-format-selected)", { desc = "Format selected text" })
map("n", "<leader>cp", ":CocCommand prettier.formatFile<CR>", { desc = "Format with Prettier" })

--═══════════════════════════════════════════════════════════════════════════════════
-- SEARCH & NAVIGATION - Find files, search content
--═══════════════════════════════════════════════════════════════════════════════════

map("n", "<leader>ff", ":Telescope find_files hidden=true<CR>", { desc = "Find files" })
map("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Live grep" })
map("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Buffers" })

--═══════════════════════════════════════════════════════════════════════════════════
-- FILE EXPLORER - NvimTree operations
--═══════════════════════════════════════════════════════════════════════════════════

map("n", "<leader>n", ":NvimTreeFocus<CR>", { desc = "NvimTree focus" })
map("n", "<leader>nt", ":NvimTreeToggle<CR>", { desc = "NvimTree toggle" })
map("n", "<leader>nf", ":NvimTreeFindFile<CR>", { desc = "NvimTree find file" })

--═══════════════════════════════════════════════════════════════════════════════════
-- GIT OPERATIONS - Version control
--═══════════════════════════════════════════════════════════════════════════════════

-- Basic git operations
map("n", "<leader>gaf", ":Git add %:p<CR>", { desc = "Git add current file" })
map("n", "<leader>grf", ":Git restore --staged %:p<CR>", { desc = "Git restore current file" })
map("n", "<leader>gaa", ":Git add .<CR>", { desc = "Git add all" })
map("n", "<leader>gra", ":Git restore --staged .<CR>", { desc = "Git restore all" })

-- Advanced git tools
map("n", "<leader>gg", ":Neogit<CR>", { desc = "Neogit" })
map("n", "<leader>gb", ":GitBlameToggle<CR>", { desc = "Toggle git blame" })

-- Diffview
map("n", "<leader>dvo", ":DiffviewOpen<CR>", { desc = "Diffview open" })
map("n", "<leader>dvc", ":DiffviewClose<CR>", { desc = "Diffview close" })
map("n", "<leader>dvl", ":DiffviewLog<CR>", { desc = "Diffview log" })
map("n", "<leader>dvr", ":DiffviewRefresh<CR>", { desc = "Diffview refresh" })
map("n", "<leader>dvh", ":DiffviewFileHistory<CR>", { desc = "Diffview file history" })

--═══════════════════════════════════════════════════════════════════════════════════
-- AI ASSISTANTS - ChatGPT, Claude, and GP.nvim
--═══════════════════════════════════════════════════════════════════════════════════

-- ChatGPT operations
map("n", "<leader>cgc", ":ChatGPTRun complete_code<CR>", { desc = "Complete code" })
map("n", "<leader>cge", ":ChatGPTEditWithInstructions<CR>", { desc = "Edit with instructions" })
map("n", "<leader>cgs", ":ChatGPTRun summarize<CR>", { desc = "Summarize" })
map("n", "<leader>cgp", ":ChatGPTRun optimize_code<CR>", { desc = "Optimize code" })
map("n", "<leader>cgd", ":ChatGPTRun docstring<CR>", { desc = "Add docstring" })
map("n", "<leader>cgt", ":ChatGPTRun add_tests<CR>", { desc = "Add tests" })
map("n", "<leader>cgx", ":ChatGPTRun explain_code<CR>", { desc = "Explain code" })
map("n", "<leader>cgo", ":ChatGPT<CR>", { desc = "Open ChatGPT" })

-- Claude Code
map("n", "<leader>cc", ":ClaudeCode<CR>", { desc = "Open Claude Code" })
-- Note: \cC and \cV are handled by plugin's internal keymaps

--═══════════════════════════════════════════════════════════════════════════════════
-- TESTING - Run tests at various levels
--═══════════════════════════════════════════════════════════════════════════════════

map("n", "<leader>tf", ":TestFile<CR>", { desc = "Test file" })
map("n", "<leader>ta", ":TestSuite<CR>", { desc = "Test suite" })
map("n", "<leader>tg", ":TestVisit<CR>", { desc = "Test visit" })
map("n", "<leader>tn", ":TestNearest<CR>", { desc = "Test nearest" })
map("n", "<leader>tl", ":TestLast<CR>", { desc = "Test last" })
map("n", "<leader>tv", ":TestVisit<CR>", { desc = "Test visit" })

--═══════════════════════════════════════════════════════════════════════════════════
-- DIAGNOSTICS - View and navigate code issues
--═══════════════════════════════════════════════════════════════════════════════════

map("n", "<leader>xx", ":Trouble diagnostics toggle<CR>", { desc = "Toggle Trouble Diagnostics" })
map("n", "<leader>xw", ":Trouble diagnostics toggle<CR>", { desc = "Workspace diagnostics" })
map("n", "<leader>xd", ":Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Document diagnostics" })
map("n", "<leader>xl", ":Trouble loclist toggle<CR>", { desc = "Location list" })
map("n", "<leader>xq", ":Trouble qflist toggle<CR>", { desc = "Quickfix list" })
map("n", "<leader>xs", ":Trouble symbols toggle<CR>", { desc = "Symbols (Trouble)" })
map("n", "<leader>xr", ":Trouble lsp_references toggle<CR>", { desc = "LSP References" })

--═══════════════════════════════════════════════════════════════════════════════════
-- PROJECT & UTILITIES - Project management and tools
--═══════════════════════════════════════════════════════════════════════════════════

-- Search and replace
map("n", "<leader>sr", ":lua require('spectre').toggle()<CR>", { desc = "Search and replace" })

--═══════════════════════════════════════════════════════════════════════════════════
-- LARAVEL DEVELOPMENT - PHP and Laravel specific tools
--═══════════════════════════════════════════════════════════════════════════════════

map("n", "<leader>lc", ":PhpCreateClass<CR>", { desc = "Create PHP class" })
map("n", "<leader>ln", ":PhpCreateNamespace<CR>", { desc = "Create PHP namespace" })
map("n", "<leader>lf", ":PhpCreateFile<CR>", { desc = "Create PHP file" })

--═══════════════════════════════════════════════════════════════════════════════════
-- COMPLETION & INSERT MODE - Autocomplete and AI assistance
--═══════════════════════════════════════════════════════════════════════════════════

pcall(vim.keymap.del, 'i', '<Tab>')
pcall(vim.keymap.del, 'i', '<S-Tab>')

-- COC completion
map("i", "<Tab>", function()
    if vim.fn["coc#pum#visible"]() == 1 then
        return vim.fn["coc#pum#confirm"]()
    end

    if vim.fn.pumvisible() == 1 then
        return termcodes('<C-y>')
    end

    local snippet_jump = coc_snippet_jump()
    if snippet_jump then
        return snippet_jump
    end

    local copilot_accept = copilot_accept_tab()
    if copilot_accept then
        return copilot_accept
    end

    if should_insert_tab() then
        return termcodes('<Tab>')
    end

    return vim.fn["coc#refresh"]()
end, {
    expr = true,
    silent = true,
    replace_keycodes = false,
    desc = "Confirm completion, snippet, or Copilot",
})

map("i", "<S-Tab>", function()
    if vim.fn["coc#pum#visible"]() == 1 then
        return vim.fn["coc#pum#prev"](1)
    end

    local ok, jumpable = pcall(function()
        return vim.fn['coc#jumpable'](-1)
    end)
    if ok and jumpable == 1 then
        return termcodes('<Plug>(coc-snippets-jump-prev)')
    end

    if vim.fn.pumvisible() == 1 then
        return termcodes('<C-p>')
    end

    return termcodes('<C-h>')
end, {
    expr = true,
    silent = true,
    replace_keycodes = false,
    desc = "Previous completion or snippet back",
})

map("i", "<CR>", function()
    if vim.fn["coc#pum#visible"]() == 1 then
        return vim.fn["coc#pum#confirm"]()
    else
        return "<C-g>u<CR><c-r>=coc#on_enter()<CR>"
    end
end, { expr = true, silent = true, desc = "COC enter completion" })

--═══════════════════════════════════════════════════════════════════════════════════
-- PLUGIN-HANDLED KEYBINDINGS - These are set by the plugins themselves:
--═══════════════════════════════════════════════════════════════════════════════════
-- Flash.nvim:      <C-Space>, <C-x>, S
-- Harpoon:         \ha, \hh, \h1-4
-- GP.nvim:         \ga, \gr, \go, \gs, \ge, \gp, \gd, \gt, \gf
-- Claude Code:     <C-,>, \cC, \cV
-- Copilot:         <C-J>, <C-L> (insert mode)
-- Project.nvim:    \pp
-- Telescope:       (various extensions)
--═══════════════════════════════════════════════════════════════════════════════════
