vim.cmd [[
  augroup _fold_bug_solution  " https://github.com/nvim-telescope/telescope.nvim/issues/559
    autocmd!
    autocmd BufRead * autocmd BufWinEnter * ++once normal! zx
  augroup end

  augroup _eslintfix
    autocmd!
    autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll
  augroup end
]]



-- autocmd BufWritePre *.hs,*.elm,*.ex,*.html,*.json,*.css lua vim.lsp.buf.formatting_sync()
-- autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll
