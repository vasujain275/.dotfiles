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
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    config = function()
      -- import nvim-autopairs
      local autopairs = require("nvim-autopairs")

      -- configure autopairs
      autopairs.setup({
        check_ts = true,                      -- enable treesitter
        ts_config = {
          lua = { "string" },                 -- don't add pairs in lua string treesitter nodes
          javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
          java = false,                       -- don't check treesitter on java
        },
      })

      -- import nvim-autopairs completion functionality
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")

      -- import nvim-cmp plugin (completions plugin)
      local cmp = require("cmp")

      -- make autopairs and completion work together
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
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
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'

      lint.linters_by_ft = {
        javascript = { 'biomejs' },
        typescript = { 'biomejs' },
        javascriptreact = { 'biomejs' },
        typescriptreact = { 'biomejs' },
        svelte = { 'biomejs' },
        -- python = { 'pylint' },
      }

      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })

      vim.keymap.set('n', '<leader>l', function()
        lint.try_lint()
      end, { desc = 'Trigger linting for current file' })
    end,
  },
  {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local conform = require 'conform'

      conform.setup {
        formatters_by_ft = {
          javascript = { 'biome' },
          typescript = { 'biome' },
          javascriptreact = { 'biome' },
          typescriptreact = { 'biome' },
          svelte = { 'biome' },
          css = { 'biome' },
          html = { 'biome' },
          json = { 'biome' },
          yaml = { 'biome' },
          markdown = { 'biome' },
          graphql = { 'biome' },
          liquid = { 'biome' },
          -- lua = { 'stylua' },
          -- python = { 'isort', 'black' },
        },
        format_on_save = {
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        },
      }

      vim.keymap.set({ 'n', 'v' }, '<leader>mp', function()
        conform.format {
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        }
      end, { desc = 'Format file or range (in visual mode)' })
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
