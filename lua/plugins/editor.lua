return {
  { 'folke/todo-comments.nvim', enabled = false },

  {
    'folke/which-key.nvim',
    opts = {
      preset = 'modern',
      delay = 500,
    },
  },

  {
    'folke/trouble.nvim',

    dependencies = { 'nvim-tree/nvim-web-devicons' },

    keys = {
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle win.position=left win.size=80<cr>',
        desc = 'Symbols (Trouble)',
      },
    },
  },

  {
    'folke/flash.nvim',

    event = 'VeryLazy',
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
