local M = {
  "folke/tokyonight.nvim",
  commit = "e52c41314e83232840d6970e6b072f9fba242eb9",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

M.name = "tokyonight-night"

function M.config()
  local tokyonight_status_ok, tokyonight = pcall(require, "tokyonight")

  if not tokyonight_status_ok then
    return
  end

  tokyonight.setup {
    transparent = true,
    transparent_sidebar = true,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
  }

  local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)

  if not status_ok then
    return
  end
end

return M
