-- Show open buffers in status line at the top like GUI editors
local M = {
  "akinsho/bufferline.nvim",
  event = { "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
  dependencies = "famiu/bufdelete.nvim",
  opts = {},
}

return M
