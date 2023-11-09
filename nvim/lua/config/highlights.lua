vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = "pum"
vim.opt.pumblend = 50
vim.opt.background = "dark"

vim.cmd([[
  highlight Pmenu ctermbg=8 ctermfg=0
  highlight Pmenusel ctermbg=15 ctermfg=0
]])

vim.cmd([[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=100})
  augroup END
]])
