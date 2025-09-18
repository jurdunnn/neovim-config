-- Colorscheme and theme

return {
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false, -- Make sure we load this during startup
    priority = 1000, -- Make sure to load this before all the other start plugins
    config = function()
      require("cyberdream").setup({
        transparent = false,
        italic_comments = true,
        hide_fillchars = true,
        borderless_telescope = true,
        terminal_colors = true,
      })
      vim.cmd.colorscheme("cyberdream")
    end,
  },
}