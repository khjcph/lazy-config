return {
  { "folke/todo-comments.nvim", enabled = false },

  {
    "simrat39/symbols-outline.nvim",
    optional = true,

    opts = {
      position = "left",
    },
  },

  -- {
  --   "lewis6991/gitsigns.nvim",
  --   opts = {
  --     -- temporary, see https://github.com/LazyVim/LazyVim/issues/2039
  --     _extmark_signs = false,
  --   },
  -- },

  {
    "nvim-neo-tree/neo-tree.nvim",

    opts = {
      window = {
        position = "right",
      },
    },
    keys = {
      {
        "<leader>fe",
        function()
          require("neo-tree.command").execute({
            toggle = true,
            -- position = "float",
            reveal = true,
            dir = require("lazyvim.util").root.get(),
          })
        end,
        desc = "Explorer NeoTree (root dir)",
      },
      {
        "<leader>fE",
        function()
          require("neo-tree.command").execute({
            toggle = true,
            --position = "float",
            reveal = true,
            dir = vim.loop.cwd(),
          })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
      { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
      { "<leader>E", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
    },
  },

  {
    "nvim-telescope/telescope.nvim",

    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",

      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    opts = {
      defaults = {
        sorting_strategy = "descending",
      },
    },
  },

  {
    "folke/trouble.nvim",

    opts = {
      position = "left",
    },
  },

  {
    "folke/flash.nvim",

    event = "VeryLazy",
    vscode = true,
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump(
            {
              search = {
                mode = function(str)
                  return "\\<" .. str
                end,
              },
            }
          )
        end,
        desc = "Flash"
      },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o",               function() require("flash").remote() end,     desc = "Remote Flash" },
      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc =
        "Treesitter Search"
      },
      {
        "<c-s>",
        mode = { "c" },
        function() require("flash").toggle() end,
        desc =
        "Toggle Flash Search"
      },
    },
  },
}
