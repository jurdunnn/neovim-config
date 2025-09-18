-- Custom commands

-- Helper function for input with better error handling
local function safe_input(prompt, default)
    local ok, result = pcall(vim.fn.input, prompt, default or "")
    if not ok or result == "" then
        return nil
    end
    return result
end

-- Git commit function
local function git_commit()
    local commit_msg = safe_input("Enter commit message: ")
    if commit_msg then
        vim.fn.system("git commit -m " .. vim.fn.shellescape(commit_msg))
        print("Committed: " .. commit_msg)
    else
        print("Commit cancelled")
    end
end

-- Git push function
local function git_push()
    print("Pushing to remote...")
    local result = vim.fn.system("git push")
    if vim.v.shell_error == 0 then
        print("Push successful")
    else
        print("Push failed: " .. result)
    end
end

-- Git commit and push function
local function git_commit_and_push()
    git_commit()
    if vim.v.shell_error == 0 then
        git_push()
    end
end

-- Create user commands
vim.api.nvim_create_user_command("Gc", git_commit, { desc = "Git commit" })
vim.api.nvim_create_user_command("Gp", git_push, { desc = "Git push" })
vim.api.nvim_create_user_command("Gcp", git_commit_and_push, { desc = "Git commit and push" })

-- COC documentation function (needed for keybinding)
function ShowDocumentation()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end

-- Make function global so it can be called from keybindings
_G.ShowDocumentation = ShowDocumentation