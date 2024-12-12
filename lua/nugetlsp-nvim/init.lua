local M = {}

function M.setup(opts)
  opts = opts or {}

  local client = vim.lsp.start_client {
    name = 'nugetlsp',
    cmd = { 'nugetlsp', '--stdio' },
  }

  if not client then
    print 'Failed to start nugetlsp server'
  else
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
      pattern = '*.csproj',
      callback = function()
        vim.lsp.buf_attach_client(0, client)
      end,
    })
  end
end

return M
