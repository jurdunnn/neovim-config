-- Nvim-tree configuration (modern replacement for NERDTree)

-- Define diagnostic signs before setup to avoid sign placement errors
vim.fn.sign_define("NvimTreeDiagnosticErrorIcon", {text = "", texthl = "DiagnosticError"})
vim.fn.sign_define("NvimTreeDiagnosticWarnIcon", {text = "", texthl = "DiagnosticWarn"})
vim.fn.sign_define("NvimTreeDiagnosticInfoIcon", {text = "", texthl = "DiagnosticInfo"})
vim.fn.sign_define("NvimTreeDiagnosticHintIcon", {text = "", texthl = "DiagnosticHint"})

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
    side = "left",
  },
  renderer = {
    group_empty = true,
    icons = {
      show = {
        git = true,
        folder = true,
        file = true,
        folder_arrow = true,
      },
    },
  },
  filters = {
    dotfiles = false,
    custom = { "^.git$", "node_modules", "vendor" },
  },
  git = {
    enable = true,
    ignore = false,
  },
  actions = {
    open_file = {
      quit_on_open = false,
      resize_window = true,
    },
  },
  update_focused_file = {
    enable = true,
    update_root = false,
    ignore_list = {},
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
})