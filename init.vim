call plug#begin('~/.vim/plugged')
  " Telescope: https://github.com/nvim-telescope/telescope.nvim
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  " Other plugins
  Plug 'gruvbox-community/gruvbox'
call plug#end()

colorscheme gruvbox

let mapleader = " "

fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 70})
augroup END

" Removes whitespace on buffer write
augroup white_space_trimmer
  autocmd!
  autocmd BufWritePre * :call TrimWhitespace()
augroup END
