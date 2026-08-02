local M = {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-neotest/neotest-jest',
  },

  config = function()
    -- neotest parses test positions in a `-u NONE` child process, which has no
    -- access to nvim-treesitter's filetype->language registrations. That makes
    -- it fail on `.tsx`/`.jsx` files with `No parser for language
    -- `typescriptreact` (the filetype never gets mapped to the `tsx` parser).
    -- Disabling the subprocess makes parsing happen in-process, where the
    -- mapping exists. neotest treats in-process parsing as a supported fallback.
    pcall(function()
      require('neotest.lib').subprocess.enabled = function()
        return false
      end
    end)

    require('neotest').setup {
      adapters = {
        require 'neotest-jest' {
          -- NOTE: We intentionally do NOT set `jestCommand`. neotest-jest then
          -- auto-detects the local `node_modules/.bin/jest` and runs it directly.
          -- Routing through `npm test` breaks it, because project test scripts
          -- often wrap jest with extra flags (e.g. `jest --coverage && tsc
          -- --noEmit`) - neotest's own args (--config/--json/--testNamePattern)
          -- get appended after that chain and never reach jest.
          --
          -- `jestConfigFile` is likewise left to the default, which walks up to
          -- the nearest jest.config.{js,ts} (works for both a repo root and a
          -- package inside a monorepo).
          env = { CI = true, NODE_ENV = 'test', TZ = 'UTC' },
          -- Run from the nearest package.json directory so jest's `<rootDir>`
          -- (and moduleMapper, setup files etc.) resolve correctly.
          cwd = function(file)
            return require('neotest.lib').files.match_root_pattern 'package.json'(file) or vim.fn.getcwd()
          end,
        },
      },
    }
  end,

  keys = {
    { '<leader>t', '', desc = '+test' },
    {
      '<leader>tt',
      function()
        require('neotest').run.run(vim.fn.expand '%')
      end,
      desc = 'Run File',
    },
    {
      '<leader>tT',
      function()
        require('neotest').run.run(vim.uv.cwd())
      end,
      desc = 'Run All Test Files',
    },
    {
      '<leader>tr',
      function()
        require('neotest').run.run()
      end,
      desc = 'Run Nearest',
    },
    {
      '<leader>tl',
      function()
        require('neotest').run.run_last()
      end,
      desc = 'Run Last',
    },
    {
      '<leader>ts',
      function()
        require('neotest').summary.toggle()
      end,
      desc = 'Toggle Summary',
    },
    {
      '<leader>to',
      function()
        require('neotest').output.open { enter = true, auto_close = true }
      end,
      desc = 'Show Output',
    },
    {
      '<leader>tO',
      function()
        require('neotest').output_panel.toggle()
      end,
      desc = 'Toggle Output Panel',
    },
    {
      '<leader>tS',
      function()
        require('neotest').run.stop()
      end,
      desc = 'Stop',
    },
    {
      '<leader>tw',
      function()
        require('neotest').watch.toggle(vim.fn.expand '%')
      end,
      desc = 'Toggle Watch',
    },
  },
}

return M
