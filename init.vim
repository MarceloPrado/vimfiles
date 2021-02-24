call plug#begin('~/.vim/plugged')
  " Telescope: https://github.com/nvim-telescope/telescope.nvim
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  " Other plugins
  Plug 'gruvbox-community/gruvbox'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  Plug 'tpope/vim-fugitive'
  Plug 'vim-airline/vim-airline'

  " Comment and uncomment line of codes
  Plug 'tpope/vim-commentary'

  " Elixir syntax highlighting
  Plug 'elixir-editors/vim-elixir'

  Plug 'kassio/neoterm'
call plug#end()

colorscheme gruvbox

let mapleader = " "

" Moves through multiple windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Resize windows
" nnoremap <leader>+ :resize +10<CR>
" nnoremap <leader>- :resize -10<CR>
" nnoremap <leader>+ :vertical resize -10<CR>
" nnoremap <leader>v- :vertical resize +10<CR>
" nnoremap <leader>= :wincmd =<CR>
nnoremap <silent> <c-Up> :resize -1<CR>
nnoremap <silent> <c-Down> :resize +1<CR>
nnoremap <silent> <c-left> :vertical resize -1<CR>
nnoremap <silent> <c-right> :vertical resize +1<CR>

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
