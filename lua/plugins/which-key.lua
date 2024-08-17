-- Useful plugin to show you pending keybinds.
local M = {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    spec = {
      {
        mode = { 'n', 'v' },
        { '<leader>b', group = 'Buffer' },
        { '<leader>c', group = 'Code' },
        { '<leader>d', group = 'Diagnostics' },
        { '<leader>g', group = 'Git' },
        { '<leader>gt', group = 'Git Toggle' },
        { '<leader>h', group = 'Git Hunk' },
        { '<leader>l', group = 'LSP' },
        { '<leader>s', group = 'Search' },
        { '<leader>t', group = 'Toggle' },
        { 'g', group = 'Goto' },
        { 'z', group = 'Fold' },
        { '[', group = 'Prev' },
        { ']', group = 'Next' },
      },
    },
  },
  keys = {
    {
      '<leader>?',
      function()
        require('which-key').show { global = false }
      end,
      desc = 'Buffer Local Keymaps (which-key)',
    },
  },
}

return M
