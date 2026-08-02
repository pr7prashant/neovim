-- Press Esc to clear highlight
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Press jk fast in insert mode to switch to Normal mode
vim.keymap.set('i', 'jk', '<Esc>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous Diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next Diagnostic message' })
vim.keymap.set('n', '<leader>De', vim.diagnostic.open_float, { desc = 'Show Diagnostic Error messages' })
vim.keymap.set('n', '<leader>Dq', vim.diagnostic.setloclist, { desc = 'Open Diagnostic Quickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Resize with arrows
vim.keymap.set('n', '<S-Up>', ':resize -2<CR>')
vim.keymap.set('n', '<S-Down>', ':resize +2<CR>')
vim.keymap.set('n', '<S-Left>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<S-Right>', ':vertical resize +2<CR>')

-- Navigate buffers
vim.keymap.set('n', '<S-h>', ':bprevious<CR>')
vim.keymap.set('n', '<S-l>', ':bnext<CR>')

-- Close buffers
vim.keymap.set('n', '<leader>bd', '<cmd>:bdelete<CR>', { desc = 'Delete Buffer' })

-- Better paste
vim.keymap.set('v', 'p', '"_dP')

-- Retain yanked value in register
vim.keymap.set('v', 'p', '"_dP')

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Move text up and down
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==')
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==')
vim.keymap.set('v', '<A-j>', ':m .+1<CR>==')
vim.keymap.set('v', '<A-k>', ':m .-2<CR>==')
vim.keymap.set('x', 'J', ":move '>+1<CR>gv-gv")
vim.keymap.set('x', 'K', ":move '<-2<CR>gv-gv")
vim.keymap.set('x', '<A-j>', ":move '>+1<CR>gv-gv")
vim.keymap.set('x', '<A-k>', ":move '<-2<CR>gv-gv")

-- Lazygit
vim.keymap.set('n', '<leader>gg', '<cmd>lua _LAZYGIT_TOGGLE()<CR>', { desc = 'LazyGit' })

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', function()
  require('ufo').openAllFolds()
end)
vim.keymap.set('n', 'zM', function()
  require('ufo').closeAllFolds()
end)

-- Find and Replace (GrugFar)
vim.keymap.set('n', '<leader>f', ':GrugFar<CR>', { desc = 'Open Find and Replace' })
vim.keymap.set('v', '<leader>f', function()
  local grug_far = require 'grug-far'
  local lines = grug_far.get_current_visual_selection_lines() or {}
  local flags = '--fixed-strings'

  if #lines > 1 then
    flags = flags .. ' --multiline'
  end

  grug_far.open {
    prefills = {
      search = table.concat(lines, '\n'),
      flags = flags,
    },
  }
end, { desc = 'Open Find & Replace (prefill)' })
