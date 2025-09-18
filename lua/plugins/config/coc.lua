-- COC (Conquer of Completion) configuration

-- Highlight symbol and references on cursor hold
vim.api.nvim_create_autocmd("CursorHold", {
    pattern = "*",
    callback = function()
        vim.fn.CocActionAsync('highlight')
    end,
    desc = "Highlight symbol and references on cursor hold"
})