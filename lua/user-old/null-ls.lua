local M = {
  "jose-elias-alvarez/null-ls.nvim",
  event = "BufReadPre",
  commit = "60b4a7167c79c7d04d1ff48b55f2235bf58158a7",
  dependencies = {
    {
      "nvim-lua/plenary.nvim",
      commit = "9a0d3bf7b832818c042aaf30f692b081ddd58bd9",
    },
  },
}

function M.config()
  local null_ls = require "null-ls"
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
  local formatting = null_ls.builtins.formatting
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
  local diagnostics = null_ls.builtins.diagnostics

  local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

  -- https://github.com/prettier-solidity/prettier-plugin-solidity
  null_ls.setup {
    debug = false,
    sources = {
      formatting.prettierd,
      formatting.black.with { extra_args = { "--fast" } },
      formatting.stylua,
      formatting.google_java_format,
      formatting.rustfmt,
      diagnostics.flake8,
      diagnostics.eslint_d.with { extra_args = { "--quiet" } },
    },
    -- you can reuse a shared lspconfig on_attach callback here
    on_attach = function(client, bufnr)
      if client.supports_method "textDocument/formatting" then
        vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
            -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
            vim.lsp.buf.format { async = false }
          end,
        })
      end
    end,
  }

  null_ls.builtins.formatting.prettierd.with {
    condition = function(utils)
      return utils.has_file { ".prettierrc", ".prettierrc.js" }
    end,
  }
end

return M
