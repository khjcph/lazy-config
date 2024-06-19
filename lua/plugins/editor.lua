return {
  { "folke/todo-comments.nvim", enabled = false },

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
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
        },
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

    dependencies = { "nvim-tree/nvim-web-devicons" },

    keys = {
      -- { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
      -- { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle win.position=left win.size=80<cr>",
        desc = "Symbols (Trouble)",
      },
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
