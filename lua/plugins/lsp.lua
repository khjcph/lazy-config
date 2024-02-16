vim.diagnostic.config({ virtual_text = false })

return {
  { "nvimtools/none-ls.nvim", enabled = false },

  {
    "neovim/nvim-lspconfig",

    opts = {
      diagnostics = {
        virtual_text = false,
        severity_sort = true,
      },
      inlay_hints = { enabled = false },
    },
  },
}
