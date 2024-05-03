vim.cmd("setlocal tabstop=8 shiftwidth=8 noexpandtab")

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  C = {
    name = "Go",
    i = { "<cmd>GoInstallBinaries<Cr>", "Install Go Dependencies" },
    e = { "<cmd>GoEnv local.env<Cr>", "Load local.env" },
    t = { "<cmd>GoDebug<cr>", "Debug Begin" },
  },
}

which_key.register(mappings, opts)
