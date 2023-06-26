vim.cmd([[
augroup PrettierAutoCmd
  autocmd!
  autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx Prettier
augroup END
]])

