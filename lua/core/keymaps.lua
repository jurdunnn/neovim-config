-- Core keybindings

local map = vim.keymap.set

-- Use default leader key (backslash \)

-- General keybindings
map("n", "<BS>", "<C-^>", { desc = "Switch between files" })
map("n", "<Space>", ":noh<CR>", { desc = "Clear search highlight", silent = true })

-- Formatting
map({ "x", "n" }, "<leader>f", "<Plug>(coc-format-selected)", { desc = "Format selected text" })
map("n", "<C-;>", ":Autoformat<CR>", { desc = "Autoformat" })

-- Buffer navigation
map("n", "<C-b>", ":Buffers<CR>", { desc = "Show buffers" })
map("n", "<C-h>", ":BufferPrevious<CR>", { desc = "Previous buffer" })
map("n", "<C-l>", ":BufferNext<CR>", { desc = "Next buffer" })

-- Hop (navigation)
map("n", "<c-space>", "<cmd>HopWord<CR>", { desc = "Hop to word" })
map("n", "<c-x>", "<cmd>HopAnywhere<CR>", { desc = "Hop anywhere" })

-- ChatGPT
local chatgpt_keymaps = {
    { "<leader>cgc", ":ChatGPTRun complete_code<CR>", "Complete code" },
    { "<leader>cge", ":ChatGPTEditWithInstructions<CR>", "Edit with instructions" },
    { "<leader>cgs", ":ChatGPTRun summarize<CR>", "Summarize" },
    { "<leader>cgp", ":ChatGPTRun optimize_code<CR>", "Optimize code" },
    { "<leader>cgd", ":ChatGPTRun docstring<CR>", "Add docstring" },
    { "<leader>cgt", ":ChatGPTRun add_tests<CR>", "Add tests" },
    { "<leader>cgx", ":ChatGPTRun explain_code<CR>", "Explain code" },
    { "<leader>cgo", ":ChatGPT<CR>", "Open ChatGPT" },
}

for _, keymap in ipairs(chatgpt_keymaps) do
    map("n", keymap[1], keymap[2], { desc = keymap[3] })
end

-- Tests
local test_keymaps = {
    { "<leader>tf", ":TestFile<CR>", "Test file" },
    { "<leader>ta", ":TestSuite<CR>", "Test suite" },
    { "<leader>tg", ":TestVisit<CR>", "Test visit" },
    { "<leader>tn", ":TestNearest<CR>", "Test nearest" },
}

for _, keymap in ipairs(test_keymaps) do
    map("n", keymap[1], keymap[2], { desc = keymap[3] })
end

-- Git
local git_keymaps = {
    { "<leader>gaf", ":Git add %:p<CR>", "Git add current file" },
    { "<leader>grf", ":Git restore --staged %:p<CR>", "Git restore current file" },
    { "<leader>gaa", ":Git add .<CR>", "Git add all" },
    { "<leader>gra", ":Git restore --staged .<CR>", "Git restore all" },
}

for _, keymap in ipairs(git_keymaps) do
    map("n", keymap[1], keymap[2], { desc = keymap[3] })
end

-- Diffview
local diffview_keymaps = {
    { "<leader>dvo", ":DiffviewOpen<CR>", "Diffview open" },
    { "<leader>dvc", ":DiffviewClose<CR>", "Diffview close" },
    { "<leader>dvl", ":DiffviewLog<CR>", "Diffview log" },
    { "<leader>dvr", ":DiffviewRefresh<CR>", "Diffview refresh" },
}

for _, keymap in ipairs(diffview_keymaps) do
    map("n", keymap[1], keymap[2], { desc = keymap[3] })
end

-- Telescope
local telescope_keymaps = {
    { "<leader>ff", ":Telescope find_files hidden=true<CR>", "Find files" },
    { "<leader>fg", ":Telescope live_grep<CR>", "Live grep" },
    { "<leader>fb", ":Telescope buffers<CR>", "Buffers" },
}

for _, keymap in ipairs(telescope_keymaps) do
    map("n", keymap[1], keymap[2], { desc = keymap[3] })
end

-- NERDTree
local nerdtree_keymaps = {
    { "<leader>n", ":NERDTreeFocus<CR>", "NERDTree focus" },
    { "<leader>nt", ":NERDTreeToggle<CR>", "NERDTree toggle" },
    { "<leader>nf", ":NERDTreeFind<CR>", "NERDTree find" },
}

for _, keymap in ipairs(nerdtree_keymaps) do
    map("n", keymap[1], keymap[2], { desc = keymap[3] })
end

-- COC navigation
local coc_keymaps = {
    { "gd", "<Plug>(coc-definition)", "Go to definition", silent = true },
    { "gy", "<Plug>(coc-type-definition)", "Go to type definition", silent = true },
    { "gi", "<Plug>(coc-implementation)", "Go to implementation", silent = true },
    { "gr", "<Plug>(coc-references)", "Go to references", silent = true },
    { "<leader>rn", "<Plug>(coc-rename)", "Rename", silent = true },
    { "<leader>cp", ":CocCommand prettier.formatFile<CR>", "Format with Prettier" },
}

for _, keymap in ipairs(coc_keymaps) do
    local opts = { desc = keymap[3] }
    if keymap.silent then
        opts.silent = true
    end
    map("n", keymap[1], keymap[2], opts)
end

-- Documentation
map("n", "K", ":call ShowDocumentation()<CR>", { desc = "Show documentation", silent = true })

-- COC completion
map("i", "<TAB>", function()
    if vim.fn["coc#pum#visible"]() == 1 then
        return vim.fn["coc#pum#next"](1)
    elseif vim.fn.col('.') == 1 or vim.fn.getline('.'):sub(vim.fn.col('.') - 1, vim.fn.col('.') - 1):match('%s') then
        return "<Tab>"
    else
        return vim.fn["coc#refresh"]()
    end
end, { expr = true, silent = true, desc = "COC tab completion" })

map("i", "<S-TAB>", function()
    if vim.fn["coc#pum#visible"]() == 1 then
        return vim.fn["coc#pum#prev"](1)
    else
        return "<C-h>"
    end
end, { expr = true, desc = "COC shift-tab completion" })

map("i", "<CR>", function()
    if vim.fn["coc#pum#visible"]() == 1 then
        return vim.fn["coc#pum#confirm"]()
    else
        return "<C-g>u<CR><c-r>=coc#on_enter()<CR>"
    end
end, { expr = true, silent = true, desc = "COC enter completion" })