-- Barbar configuration

-- Disable auto-setup to use manual configuration
vim.g.barbar_auto_setup = false

require('barbar').setup({
  -- Hide barbar if there is only a single tab
  auto_hide = true,

  -- Exclude terminal buffers (like Claude Code) from tabs
  exclude_name = { 'term://*' },

  -- Also exclude common buffer types that shouldn't show in tabs
  exclude_ft = { 'help', 'qf', 'terminal' },

  -- Enable clickable tabs
  clickable = true,

  -- Enable animations
  animation = true,
})