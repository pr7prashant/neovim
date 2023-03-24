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

local colorscheme = "tokyonight-night"

local colorscheme_status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not colorscheme_status_ok then
  return
end
