local lspconfig = require("lspconfig")

lspconfig.omnisharp.setup {
  cmd = { 'omnisharp', '--languageserver', '--hostPID', tostring(vim.fn.getpid()) }, -- Assuming you have an on_attach function. Delete this line if you don't.
}
