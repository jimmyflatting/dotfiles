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
    cmd = { "clangd", "--compile-commands-dir=." },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_dir = lspconfig.util.root_pattern("compile_commands.json", ".clangd", ".git"),
}
