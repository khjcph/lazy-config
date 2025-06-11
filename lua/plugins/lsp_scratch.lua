vim.diagnostic.config({ virtual_text = false })
vim.lsp.set_log_level('warn')

local function preview_location_callback(err, result, ctx)
  if result == nil or vim.tbl_isempty(result) then
    vim.lsp.log.info(ctx.method, 'No location found')
    return nil
  end
  if vim.tbl_islist(result) then
    local ts_utils = require('nvim-treesitter.ts_utils')
    vim.lsp.log.info(result, 'result')

    vim.lsp.log.info(result[1].uri, 'uri')
    local bo = vim.uri_to_bufnr(result[1].uri)
    vim.lsp.log.info(bo, 'buf')
    -- vim.lsp.log.info(vim.api.nvim_buf_get_name(bo), 'buf')

    vim.fn.bufload(bo)
    local lt = vim.treesitter.get_parser(bo, 'go')
    if not lt then
      return
    end
    lt:parse()

    local lin = result[1].range.start.line
    local car = result[1].range.start.character
    -- will match the type_identifier
    -- find root in a loop
    local tinode = vim.treesitter.get_node({ bufnr = bo, pos = { lin, car }, lang = 'go' })
    if not tinode then
      return
    end
    vim.lsp.log.info(tinode:type(), 'type_identifier')

    local tsnode = tinode:parent()
    if not tsnode then
      return
    end
    vim.lsp.log.info(tsnode:type(), 'type_spec')

    local tdnode = tsnode:parent()
    if not tdnode then
      return
    end
    vim.lsp.log.info(tdnode:type(), 'type_declaration')

    local a, _, _, c, _, _ = tdnode:range(true)

    local tdec = vim.api.nvim_buf_get_lines(bo, a, c + 1, false)

    -- local sb = vim.api.nvim_create_buf(true, true)
    -- vim.api.nvim_buf_set_text(sb, 0, 0, -1, -1, tdec)

    vim.lsp.util.open_floating_preview(tdec, 'go')

    -- local s = lt:
    -- vim.lsp.log.info(s, 'source')

    -- -- will match the type_identifier
    -- local n = vim.treesitter.get_node({ bufnr = bp, pos = { 6, 5 }, lang = 'go' })
    -- vim.lsp.log.info(n, 'node')
    -- if not n then
    --   return
    -- end

    -- vim.api.nvim_buf_set_name(bo, "tree.go")
    --
    -- local bp = vim.uri_to_bufnr(result[1].uri)
    -- vim.fn.bufload(bp)
    -- vim.lsp.log.info(bp, 'bp')
    --
    -- local lt = vim.treesitter.get_parser(bp, 'go')
    -- if not lt then
    --   return
    -- end
    --
    -- lt:parse()
    --
    -- -- will match the type_identifier
    -- local n = vim.treesitter.get_node({ bufnr = bp, pos = { 6, 5 }, lang = 'go' })
    -- vim.lsp.log.info(n, 'node')
    -- if not n then
    --   return
    -- end
    --
    -- -- loop until type is type_declaration
    -- local npp = n:parent()
    -- if not npp then
    --   return
    -- end
    --
    -- local nppp = npp:parent()
    -- if not nppp then
    --   return
    -- end
    -- -- vim.lsp.log.info(cpp:type(), 'parser')
    --
    --
    -- local a, b, sbyte, c, d, ebyte = nppp:range(true)
    -- local ta, tb, tc, td = ts_utils.get_vim_range({ a, b, c, d }, b)
    --
    -- local lines = vim.api.nvim_buf_get_lines(bo, a, tc, false)
    -- vim.api.nvim_buf_delete(bo, { force = true })
    -- vim.lsp.log.info(lines, 'lines')
    --
    -- -- -- We have to remember that end_col is end-exclusive
    -- -- local start_row, start_col, end_row, end_col = ts_utils.get_vim_range({ a, b, cc, d }, b)
    -- -- -- vim.lsp.log.info(start_row, start_col, end_row, end_col, 'parser')
    -- -- --
    -- -- --
    -- -- local text
    -- -- if start_row ~= end_row then
    -- --   local lines = vim.api.nvim_buf_get_lines(bo, start_row - 1, end_row, false)
    -- --   vim.lsp.log.info(lines, 'lines')
    -- --   if next(lines) == nil then
    -- --     return {}
    -- --   end
    -- --   lines[1] = string.sub(lines[1], start_col)
    -- --   -- end_row might be just after the last line. In this case the last line is not truncated.
    -- --   if #lines == end_row - start_row + 1 then
    -- --     lines[#lines] = string.sub(lines[#lines], 1, end_col)
    -- --   end
    -- --   text = lines
    -- -- else
    -- --   local line = vim.api.nvim_buf_get_lines(bo, start_row, start_row, false)[1]
    -- --   -- If line is nil then the line is empty
    -- --   text = line and { string.sub(line, start_col, end_col) } or {}
    -- -- end
    --
    --
    -- -- local bufcon = vim.api.nvim_buf_get_lines(b, ta, td, false)
    -- -- local q = vim.treesitter.parse_query('go', [[
    -- -- (type_declaration)
    -- -- ]])
    -- -- vim.lsp.log.info(vim.inspect(ts_utils.get_root_for_position(6, 5, lt)))
    --
    -- vim.lsp.util.open_floating_preview(lines, 'go')
  else
    vim.lsp.log.info(ctx.method, 'Not List')
    vim.lsp.util.preview_location(result)
  end
end

-- function peek_definition()
--   local clients = vim.lsp.get_clients({ bufnr = 0 })
--
--   -- vim.lsp.log.info(clients[1].capabilities.textDocument.typeDefinition.linkSupport, 'abilities')
--
--   local params = vim.lsp.util.make_position_params(0, clients[1].offset_encoding or 'utf-16')
--   return vim.lsp.buf_request(0, 'textDocument/typeDefinition', params, preview_location_callback)
-- end
--
-- function buf()
--   vim.lsp.log.info(vim.api.nvim_get_current_buf(), 'buffer')
-- end

return {
  { 'nvimtools/none-ls.nvim', enabled = false },

  {
    'neovim/nvim-lspconfig',

    opts = {
      diagnostics = {
        virtual_text = false,
        severity_sort = true,
      },
      inlay_hints = { enabled = false },
    },
    keys = {
      {
        'gY',
        function()
          local clients = vim.lsp.get_clients({ bufnr = 0 })
          local params = vim.lsp.util.make_position_params(0, clients[1].offset_encoding or 'utf-16')
          return vim.lsp.buf_request(0, 'textDocument/typeDefinition', params, preview_location_callback)
        end,
        desc = 'Peek Type Definition',
      },
    },
  },
  -- {
  --   'nvimdev/lspsaga.nvim',
  --   config = function()
  --     require('lspsaga').setup({
  --       lightbulb = {
  --         enable = false,
  --       },
  --       symbol_in_winbar = {
  --         enable = false,
  --       }
  --     })
  --   end,
  --   dependencies = {
  --     'nvim-treesitter/nvim-treesitter', -- optional
  --     'nvim-tree/nvim-web-devicons',     -- optional
  --   },
  -- },
}
