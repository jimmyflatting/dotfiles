local lspconfig = require('lspconfig')

require('mason').setup({
  ui = {
    icons = {
      server_installed = '',
    },
  }
})
require('mason-lspconfig').setup({
  ensure_installed = { 'clangd', 'pyright', 'intelephense', 'ts_ls', 'lua_ls', 'emmet_ls' },
})
require('mason-lspconfig').setup_handlers({
  function(server)
    lspconfig[server].setup({})
  end,
})

lspconfig.clangd.setup {
    cmd = { "clangd", "--compile-commands-dir=.", "--offset-encoding=utf-8", },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_dir = lspconfig.util.root_pattern("compile_commands.json", ".clangd", ".git"),
}

require('lspconfig').intelephense.setup({
on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    intelephense = {
      environment = {
        includePaths = {"./stubs/php-stubs"}
      }
    }
  }
})
