-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- write buffer to file
vim.keymap.set("n", "<leader>fw", "<cmd>w<cr>", { noremap = true, desc = "write" })
vim.keymap.set("n", "<leader>fs", "<cmd>w<cr>", { noremap = true, desc = "write" })

-- nvim dev stuff put in seperate conf.
-- TODO: integrate with whichkey
vim.keymap.set("n", "<leader>ns", "<cmd>source %<cr>", { noremap = true, desc = "source" })

-- tmux navigator
-- TODO: see util plugins for a potentially cleaner way
vim.keymap.set('n', "<C-h>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft()<CR>",
  { noremap = true, silent = true })
vim.keymap.set('n', "<C-j>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown()<CR>",
  { noremap = true, silent = true })
vim.keymap.set('n', "<C-k>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp()<CR>",
  { noremap = true, silent = true })
vim.keymap.set('n', "<C-l>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight()<CR>",
  { noremap = true, silent = true })
vim.keymap.set('n', "<C-\\>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLastActive()<CR>",
  { noremap = true, silent = true })
vim.keymap.set('n', "<C-space>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateNext()<CR>",
  { noremap = true, silent = true })
