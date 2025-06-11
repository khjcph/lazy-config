return {
  {
    'LazyVim/LazyVim',

    opts = {
      colorscheme = 'gruvbox-material',
      -- colorscheme = "kanagawa",
      -- colorscheme = "kanagawa-wave",
      -- colorscheme = "kanagawa-lotus",
      -- colorscheme = "kanagawa-dragon",
      -- colorscheme = 'kanagawa-paper',
    },
  },

  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_enable_italic = 0
      vim.g.gruvbox_material_disable_italic_comment = 0
      vim.g.gruvbox_material_background = 'medium'
      vim.g.gruvbox_material_foreground = 'material'
    end,
  },

  {
    'thesimonho/kanagawa-paper.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
  },

  {
    'rebelot/kanagawa.nvim',

    opts = {
      theme = 'wave',
      background = {
        theme = 'wave',
        dark = 'dragon',
        light = 'lotus',
      },
      overrides = function(colors)
        local theme = colors.theme
        return {}
      end,
    },
  },
}
