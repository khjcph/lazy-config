vim.opt.background = "light"

vim.g.gruvbox_material_enable_bold = 0
vim.g.gruvbox_material_enable_italic = 0
vim.g.gruvbox_material_disable_italic_comment = 0
vim.g.gruvbox_material_background = "medium"
vim.g.gruvbox_material_foreground = "material"

return {
  { "sainnhe/gruvbox-material" },
  { "huyvohcmc/atlas.vim" },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      background = {
        dark = "frappe",
        light = "latte",
      },
    },
  },

  {
    "rebelot/kanagawa.nvim",

    opts = {
      theme = "wave",
      background = {
        theme = "wave",
        dark = "dragon",
        light = "lotus",
      },
      overrides = function(colors)
        local theme = colors.theme
        return {
          TelescopeTitle = { fg = theme.ui.special, bold = true },
          TelescopePromptNormal = { bg = theme.ui.bg_p1 },
          TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
          TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
          TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
          TelescopePreviewNormal = { bg = theme.ui.bg_dim },
          TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
          PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = theme.ui.bg_p2 },

          NeotestAdapterName = { fg = theme.ui.special, bold = true },
          NeotestDir = { fg = theme.ui.special, bold = true },
          NeotestFile = { fg = theme.ui.special, bold = true },
          NeotestRunning = { fg = theme.ui.special, bold = true },
          NeotestPassed = { fg = theme.ui.special, bold = true },

          IlluminatedWordText = { bg = theme.ui.bg_p2 },

          -- ["@lsp.type.keyword.go"] = { bg = theme.ui.bg_p2 },
          -- ["@keyword.return.go"] = { bg = theme.ui.bg_p2 },

          -- ["@variable"] = { bold = true }
          -- ["@keyword.return"] = vim.tbl_extend("force", { fg = theme.syn.special3 }, theme.syn.special3),
        }
      end,
    },
  },

  {
    "LazyVim/LazyVim",

    opts = {
      -- colorscheme = "catppuccin",
      -- colorscheme = "gruvbox-material",
      -- colorscheme = "kanagawa-wave",
      -- colorscheme = "kanagawa-lotus",
      -- colorscheme = "kanagawa-dragon",
      -- colorscheme = "atlas",
      colorscheme = "kanagawa",
    },
  },
}
