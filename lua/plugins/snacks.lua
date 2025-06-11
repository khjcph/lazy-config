return {
  {
    'folke/snacks.nvim',
    ---@type snacks.Config
    opts = {
      lazygit = {
        enabled = true,
      },
      dashboard = {
        sections = {
          {
            { icon = ' ', desc = '_', action = ":lua Snacks.dashboard.pick('files')", indent = 27 },

            gap = 1,
            padding = 1,
          },
          { section = 'startup' },
        },
      },
      image = { enabled = false },
      dim = { enabled = true },
      statuscolumn = { enabled = true },
      picker = {
        sources = {
          explorer = {
            auto_close = true,
            jump = { close = false },
            layout = { layout = { position = 'right', width = 0.25 } },
          },
        },
      },
      explorer = {
        replace_netrw = true,
      },
      terminal = {},
    },
  },
}
