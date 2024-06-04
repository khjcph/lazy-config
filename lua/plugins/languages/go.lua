-- where to put this stuff??
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   group = vim.api.nvim_create_augroup("Golang", { clear = true }),
--   pattern = "*.go",
--   callback = function()
--     local bufnr = vim.api.nvim_get_current_buf()
--     local bufcon = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
--
--     local Job = require 'plenary.job'
--     local formatted = Job:new({
--       writer = Job:new({ writer = bufcon, command = 'goimports', }),
--       command = 'gofumpt',
--     }):sync()
--
--     vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, formatted)
--
--     -- really just call this prob. :)
--     -- vim.lsp.buf.format()
--   end
-- })
--

-- vim.api.nvim_create_autocmd('BufWritePre', {
--   pattern = '*.go',
--   callback = function()
--     vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
--   end
-- })

---------BEGIN
return {

  {
    "neovim/nvim-lspconfig",

    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              gofumpt = true,
              semanticTokens = true,
              analyses = {
                fieldalignment = false,
              },

              buildFlags = { "-tags", "integration,concurrent" },
            },
          },
        },
      },
    },
  },

  {
    "leoluz/nvim-dap-go",

    optional = true,
    dependencies = {
      "mfussenegger/nvim-dap",
    },

    opts = {
      delve = {
        build_flags = "-tags=integration",
      },
    },
  },

  {
    "nvim-neotest/neotest",

    optional = true,
    dependencies = {
      "nvim-neotest/neotest-go",
    },

    opts = {
      adapters = {
        ["neotest-go"] = {
          args = { "-tags=integration", "-count=1" },
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",

    optional = true,

    opts = {
      formatters_by_ft = {
        -- maybe turn of formatting in the LSP?
        -- for now disable this since imports timeout randomly
        -- go = { "goimports", "gofumpt" },
        go = {},
      },
    },
  },
}
