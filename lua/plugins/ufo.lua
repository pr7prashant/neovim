local M = {
  'kevinhwang91/nvim-ufo',
  dependencies = { 'kevinhwang91/promise-async' },
  event = 'BufReadPost',
  opts = {
    -- Fold using treesitter (rich, language-aware folds) with an indent based
    -- fallback for buffers that have no parser.
    --
    -- NOTE: We deliberately don't use ufo's 'lsp' provider here. It needs the
    -- `foldingRange` capability registered *before*  the language server starts,
    -- but ufo lazy-loads after lspconfig has already started its servers, so LSP
    -- folds would silently never appear. Treesitter avoids that ordering trap.
    provider_selector = function(_, _, _)
      return { 'treesitter', 'indent' }
    end,
  },
  config = function(_, opts)
    require('ufo').setup(opts)
  end,
}

return M
