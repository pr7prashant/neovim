-- https://github.com/nvim-neo-tree/neo-tree.nvim

local M = {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '<leader>e', ':Neotree reveal position=current<CR>', { desc = 'NeoTree reveal' } },
  },
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = false,
      },
      window = {
        mappings = {
          ['<leader>e'] = 'close_window',
          -- Open grug-far find & replace scoped to the folder under the cursor
          -- (uses the containing folder when the cursor is on a file).
          ['F'] = {
            function(state)
              local node = state.tree:get_node()
              if not node then
                return
              end
              -- For a folder use its own path; for a file use its parent folder.
              -- `get_id()`/`get_parent_id()` return the filesystem path in neo-tree.
              local path = node.type == 'directory' and node:get_id() or node:get_parent_id()
              if not path then
                return
              end
              -- Move focus out of the narrow neo-tree sidebar so grug-far's
              -- window doesn't open relative to it.
              for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
                local buf = vim.api.nvim_win_get_buf(win)
                if vim.bo[buf].filetype ~= 'neo-tree' then
                  vim.api.nvim_set_current_win(win)
                  break
                end
              end
              require('grug-far').open { prefills = { paths = path } }
            end,
            desc = 'Find & Replace in folder (grug-far)',
          },
        },
      },
    },
  },
}

return M
