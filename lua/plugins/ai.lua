return {
  {
    'olimorris/codecompanion.nvim',
    config = true,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      strategies = {
        chat = {
          adapter = 'qwen',
          inline = 'qwen',
        },
      },
      adapters = {
        deepseek = function()
          return require('codecompanion.adapters').extend('ollama', {
            name = 'deepseek',
            schema = {
              model = {
                default = 'MFDoom/deepseek-coder-v2-tool-calling:16b',
              },
            },
          })
        end,
        qwen = function()
          return require('codecompanion.adapters').extend('ollama', {
            name = 'qwen',
            schema = {
              model = {
                default = 'qwen2.5-coder:14b',
              },
            },
          })
        end,
      },
      opts = {
        log_level = 'WARN',
      },
      display = {
        diff = {
          enabled = true,
          close_chat_at = 240,
          layout = 'vertical',
          opts = { 'internal', 'filler', 'closeoff', 'algorithm:patience', 'followwrap', 'linematch:120' },
          provider = 'default',
        },
        chat = {
          window = {
            layout = 'vertical',
            position = 'left',
            width = 0.30,
          },
        },
      },
    },
    keys = {
      { '<leader>a', '', desc = '+ai', mode = { 'n', 'v' } },
      {
        '<leader>aa',
        function()
          require('codecompanion').toggle()
        end,
        desc = 'Toggle (Chat)',
        mode = { 'n', 'v' },
      },
      {
        '<leader>ac',

        function()
          require('codecompanion').chat()
        end,
        desc = 'New (Chat)',
        mode = { 'n', 'v' },
      },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter',

    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        'lua',
        'markdown',
        'markdown_inline',
        'yaml',
      })
    end,
  },
}
