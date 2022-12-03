local M = {}

local on_attach = function(client, bufnr)
  --client.resolved_capabilities.document_formatting = false
  client.server_capabilities.document_formatting = true
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = EcoVim.ui.float.border }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = EcoVim.ui.float.border }),
}


local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmd = { "vscode-eslint-language-server", "--stdio" }

M.on_attach = on_attach
M.capabilities = capabilities
M.handlers = handlers
M.cmd = cmd
M.settings = {
  codeAction = {
    disableRuleComment = {
      enable = true,
      location = 'separateLine',
    },
    showDocumentation = {
      enable = true,
    },
  },
  codeActionOnSave = {
    enable = true,
    mode = 'all',
  },
  format = true,
  nodePath = '',
  onIgnoredFiles = 'off',
  packageManager = 'npm',
  quiet = false,
  rulesCustomizations = {},
  run = 'onType',
  useESLintClass = false,
  validate = 'on',
  workingDirectory = {
    mode = 'location',
  },
}

return {
  on_setup = function(server)
    server:setup(M)
  end,
}
