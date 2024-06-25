return {
  {
    'christoomey/vim-tmux-navigator',
    lazy = false,
  },
  {
    'rust-lang/rust.vim',
    ft = 'rust',
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    'm4xshen/autoclose.nvim',
    opts = {
      keys = {
        ['$'] = { escape = true, close = true, pair = '$$', disabled_filetypes = {} },
      },
    },
  },
  {
    'ThePrimeagen/vim-be-good',
  },
  {
    'mfussenegger/nvim-jdtls',
  },
  {
    'tpope/vim-eunuch',
    config = function()
      vim.cmd 'cnoreabbrev rename Rename'
    end,
  },
  {
    'xiyaowong/transparent.nvim',
  },
  -- {
  --   'mfussenegger/nvim-lint',
  --   event = {
  --     'BufReadPre',
  --     'BufNewFile',
  --   },
  --   config = function()
  --     local lint = require 'lint'
  --
  --     lint.linters_by_ft = {
  --       javascript = { 'eslint' },
  --       typescript = { 'eslint' },
  --       javascriptreact = { 'eslint' },
  --       typescriptreact = { 'eslint' },
  --       svelte = { 'eslint' },
  --     }
  --
  --     local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
  --
  --     vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
  --       group = lint_augroup,
  --       callback = function()
  --         lint.try_lint()
  --       end,
  --     })
  --
  --     vim.keymap.set('n', '<leader>ll', function()
  --       lint.try_lint()
  --     end, { desc = 'Trigger linting for current file' })
  --   end,
  -- },
  {
    'mhartington/formatter.nvim',
    event = 'VeryLazy',
    opts = function()
      return require 'custom.configs.formatter'
    end,
  },
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('oil').setup {
        default_file_explorer = true,
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        view_options = {
          show_hidden = true,
          natural_order = true,
          is_always_hidden = function(name, _)
            return name == '..' or name == '.git'
          end,
        },
        win_options = {
          wrap = true,
        },
      }
      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open Parent Directory' })
      vim.keymap.set('n', '<space>-', require('oil').toggle_float, { desc = 'Open Parent Directory in floating Window' })
    end,
  },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        theme = 'hyper',
        config = {
          week_header = {
            enable = true,
          },
          shortcut = {
            { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
            {
              icon = ' ',
              icon_hl = '@variable',
              desc = 'Files',
              group = 'Label',
              action = 'Telescope find_files',
              key = 'f',
            },
            {
              desc = ' Apps',
              group = 'DiagnosticHint',
              action = 'Telescope app',
              key = 'a',
            },
            {
              desc = ' dotfiles',
              group = 'Number',
              action = 'Telescope dotfiles',
              key = 'd',
            },
          },
        },
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  },
}
