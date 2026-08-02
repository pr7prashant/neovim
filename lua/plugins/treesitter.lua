-- Highlight, edit, and navigate code
local M = {
  'nvim-treesitter/nvim-treesitter',
  -- Pin the `main` branch: the config below uses the rewritten API
  -- (`nvim-treesitter.config`, `require('nvim-treesitter').install():await()`)
  -- which only exists on `main`. The repo's default branch is still `master`,
  -- so without this a fresh install or `:Lazy update` would pull `master` and
  -- error on startup.
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    -- Auto-install a parser for and highlight any filetype we open, instead
    -- of maintaining a fixed list of languages.
    vim.api.nvim_create_autocmd('FileType', {
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match)
        if not lang or not vim.tbl_contains(require('nvim-treesitter.config').get_available(), lang) then
          return
        end

        local buf = args.buf
        if vim.tbl_contains(require('nvim-treesitter.config').get_installed(), lang) then
          pcall(vim.treesitter.start, buf)
        elseif vim.fn.executable 'tree-sitter' == 1 then
          -- Install the parser asynchronously so opening a file whose parser
          -- isn't built yet doesn't freeze the UI for seconds. Start
          -- highlighting once the parser is ready (if the buffer still exists).
          require('nvim-treesitter').install(lang):await(function(err)
            if err then
              return
            end
            vim.schedule(function()
              if vim.api.nvim_buf_is_valid(buf) then
                pcall(vim.treesitter.start, buf)
              end
            end)
          end)
        end
      end,
    })
  end,
}

return M
