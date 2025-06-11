-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Restore cursor
vim.api.nvim_create_autocmd('VimLeave', {
  callback = function()
    vim.opt.guicursor = 't:TermCursor'
  end,
})

vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    vim.api.nvim_set_hl(0, 'CursorInsert', {
      bg = 'Red',
      reverse = false,
      bold = false,
    })
  end,
})
