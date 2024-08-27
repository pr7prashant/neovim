local M = {
  'lewis6991/gitsigns.nvim',
  event = 'BufEnter',
  cmd = 'Gitsigns',
}

M.config = function()
  local icons = require 'utils.icons'

  require('gitsigns').setup {
    signs = {
      add = {
        text = icons.ui.BoldLineMiddle,
      },
      change = {
        text = icons.ui.BoldLineDashedMiddle,
      },
      delete = {
        text = icons.ui.TriangleShortArrowRight,
      },
      topdelete = {
        text = icons.ui.TriangleShortArrowRight,
      },
      changedelete = {
        text = icons.ui.BoldLineMiddle,
      },
    },
    watch_gitdir = {
      interval = 1000,
      follow_files = true,
    },
    attach_to_untracked = true,
    current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
    update_debounce = 200,
    max_file_length = 40000,
    preview_config = {
      border = 'rounded',
      style = 'minimal',
      relative = 'cursor',
      row = 0,
      col = 1,
    },
    on_attach = function(bufnr)
      local gitsigns = require 'gitsigns'

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          gitsigns.nav_hunk 'next'
        end
      end, { desc = 'Next Hunk' })

      map('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          gitsigns.nav_hunk 'prev'
        end
      end, { desc = 'Prev Hunk' })

      -- Actions
      map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'Stage Hunk' })
      map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'Reset Hunk' })
      map('v', '<leader>hs', function()
        gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'Stage Hunk' })
      map('v', '<leader>hr', function()
        gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'Reset Hunk' })
      map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'Stage Buffer' })
      map('n', '<leader>hu', gitsigns.undo_stage_hunk, { desc = 'Undo Stage Hunk' })
      map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'Reset Buffer' })
      map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'Preview Hunk' })
      map('n', '<leader>hb', function()
        gitsigns.blame_line { full = true }
      end, { desc = 'Blame Line' })
      map('n', '<leader>gtb', gitsigns.toggle_current_line_blame, { desc = 'Toggle Current Line Blame' })
      map('n', '<leader>Tb', gitsigns.toggle_current_line_blame, { desc = 'Git Toggle Current Line Blame' })
      map('n', '<leader>hd', gitsigns.diffthis, { desc = 'Diff This' })
      map('n', '<leader>hD', function()
        gitsigns.diffthis '~'
      end, { desc = 'Diff This ~' })
      map('n', '<leader>gtd', gitsigns.toggle_deleted, { desc = 'Toggle Deleted' })
      map('n', '<leader>Td', gitsigns.toggle_deleted, { desc = 'Git Toggle Deleted' })

      -- Text object
      map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Select Hunk' })
    end,
  }
end

return M
