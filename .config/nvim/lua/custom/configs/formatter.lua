local M = {
  filetype = {
    javascript = {
      require('formatter.filetypes.javascript').prettier,
    },
    typescript = {
      require('formatter.filetypes.typescript').prettier,
    },
  },
}

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  command = 'FormatWriteLock',
})

return M
