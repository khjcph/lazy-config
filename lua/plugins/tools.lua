return {
  {
    'nvim-neorg/neorg',

    lazy = false,
    version = '*',
    config = true,
    opts = {
      load = {
        ['core.defaults'] = {},
        ['core.concealer'] = {},
        ['core.presenter'] = {
          config = {
            zen_mode = 'zen-mode',
          },
        },
        ['core.dirman'] = {
          config = {
            index = 'index.norg',
            workspaces = {
              notes = '~/Documents/notes',
              work = '~/Documents/work',
            },
            default_workspace = 'notes',
          },
        },
      },
    },
  },
}
