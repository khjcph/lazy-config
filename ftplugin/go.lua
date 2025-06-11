vim.cmd('setlocal tabstop=8 shiftwidth=8 noexpandtab')

-- TODO: work on wk mappings.
--

-- local status_ok, which_key = pcall(require, 'which-key')
-- if not status_ok then
--   return
-- end
--
-- local opts = {
--   mode = 'n', -- NORMAL mode
--   prefix = '<leader>',
--   buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
--   silent = true, -- use `silent` when creating keymaps
--   noremap = true, -- use `noremap` when creating keymaps
--   nowait = true, -- use `nowait` when creating keymaps
-- }
--
-- local mappings = {
--   C = {
--     { '<leader>C', group = 'Go', nowait = true, remap = false },
--     { '<leader>Ce', '<cmd>GoEnv local.env<Cr>', desc = 'Load local.env', nowait = true, remap = false },
--     { '<leader>Ci', '<cmd>GoInstallBinaries<Cr>', desc = 'Install Go Dependencies', nowait = true, remap = false },
--     { '<leader>Ct', '<cmd>GoDebug<cr>', desc = 'Debug Begin', nowait = true, remap = false },
--   },
-- }
--
-- which_key.register(mappings, opts)
