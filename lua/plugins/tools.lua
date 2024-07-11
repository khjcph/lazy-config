return {
  {
    "kristijanhusak/vim-dadbod-ui",

    dependencies = {
      { "tpope/vim-dadbod",                     lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },

    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },

    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },

  {
    "nvim-neorg/neorg",
    lazy = false,

    dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-neorg/neorg-telescope" } },

    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.integrations.telescope"] = {},
        ["core.dirman"] = {
          config = {
            index = "index.norg",
            workspaces = {
              notes = "~/Documents/notes",
              work = "~/Documents/work",
            },
            default_workspace = "notes",
          },
        },
      },

    }
  },
}
